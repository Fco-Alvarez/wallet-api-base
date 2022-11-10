class Api::V1::TransactionsController < ApplicationController

  has_scope :by_concept
  has_scope :by_type
  has_scope :by_account

  # GET /transactions
  def index
    @transactions = if @current_user.rol == 'admin'
                      pagy(apply_scopes(Transaction.where(user_id: @user.id).order(date: :desc)))
                    else
                      apply_scopes(Transaction.where(user_id: @user.id).order(date: :desc))
                    end

    render json: @transactions
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user_id = @user.id
    if @transaction.save(context: :create_from_controller)
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # GET /transactions/1
  def show
    @transaction = Transaction.find(params[:id])
    render json: @transaction
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # transactions/transfer
  def transfer
    @transaction = Transaction.new(transaction_params)
    @transaction.date = Date.today

    # verificando la cuenta destino del user_id
    destination_account = User.find_by(id: @transaction.user_id)
                              .accounts.find_by(id: params[:transaction][:destination_account_id])

    # @current_user.accounts.find_by(id: 3)  -> verifica que el usuario que inicio sesion
    # sea su cuenta. pero esto no deberia pasar desde el front xd
    if destination_account && @current_user.accounts.find_by(id: @transaction.account_id)
      if @transaction.save
        Transaction.create(
          user: @current_user,
          amount: @transaction.amount,
          concept: @transaction.concept,
          date: Date.today,
          kind: 'topup',
          account: destination_account
        )
        render json: @transaction, status: :created
      else
        render json: { errors: @transaction.errors.messages }, status: :unprocessable_entity
      end
    else
      render json: { errors: 'Cuenta no coincide con el que inicion sesión ó la cuenta destino
                  no coincide al usuario que se esta enviando el dinero' }, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:amount, :concept, :date, :kind, :account_id, :user_id)
  end
end
