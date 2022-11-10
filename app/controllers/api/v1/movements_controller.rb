class Api::V1::MovementsController < ApplicationController

  has_scope :by_concept
  has_scope :by_type
  has_scope :by_account

  # GET /movements
  def index
    @movements = if @current_user.rol == 'admin'
                      pagy(Movement.all).order(date: :desc)
                    else
                      apply_scopes(Movement.where(user_id: @current_user.id).order(date: :desc))
                    end

    render json: @movements
  end

  # POST /movements
  def create
    @movement = Movement.new(movement_params)
    @movement.user_id = @current_user.id
    if @movement.save(context: :create_from_controller)
      render json: @movement, status: :created
    else
      render json: @movement.errors, status: :unprocessable_entity
    end
  end

  # GET /movements/1
  def show
    @movement = Movement.find(params[:id])
    render json: @movement
  end

  # PATCH/PUT /movements/1
  def update
    if @movement.update(movement_params)
      render json: @movement
    else
      render json: @movement.errors, status: :unprocessable_entity
    end
  end

  # POST movements/transfer
  def transfer
    @movement = Movement.new(movement_params)
    @movement.date = Date.today

    # verificando la cuenta destino del user_id
    destination_account = User.find_by(id: @movement.user_id)
                              .accounts.find_by(id: params[:movement][:destination_account_id])

    # @current_user.accounts.find_by(id: 3)  -> verifica que el usuario que inicio sesion
    # sea su cuenta. pero esto no deberia pasar desde el front xd
    if destination_account && @current_user.accounts.find_by(id: @movement.account_id)
      if @movement.save
        Movement.create(
          user: @current_user,
          amount: @movement.amount,
          concept: @movement.concept,
          date: Date.today,
          kind: 'topup',
          account: destination_account
        )
        render json: @movement, status: :created
      else
        render json: { errors: @movement.errors.messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'Cuenta no coincide con el que inicion sesión ó la cuenta destino
                  no coincide al usuario que se esta enviando el dinero' }, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def movement_params
    params.require(:movement).permit(:amount, :concept, :date, :kind, :account_id, :user_id)
  end
end
