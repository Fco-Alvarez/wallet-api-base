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

  private

  # Only allow a list of trusted parameters through.
  def movement_params
    params.require(:movement).permit(:amount, :concept, :date, :kind, :account_id)
  end
end
