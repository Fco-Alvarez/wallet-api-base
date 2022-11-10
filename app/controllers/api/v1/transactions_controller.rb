class Api::V1::TransactionsController < ApplicationController

  has_scope :by_concept
  has_scope :by_type
  has_scope :by_account
  before_action :logged_in_user

  # GET /transactions
  def index
    @transactions = if @current_user.rol == 'admin'
                      pagy(Transaction.all).order(date: :desc)
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

  private

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:amount, :concept, :date, :kind, :account_id)
  end
end
