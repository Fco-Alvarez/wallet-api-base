class TransactionsController < ApplicationController
  has_scope :by_concept
  has_scope :by_type
  has_scope :by_account
  before_action :logged_in_user

  # GET /transactions
  def index
    @transactions = apply_scopes(Transaction.where(user_id: @user.id).order(date: :desc))
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

  private
  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:transaction).permit(:amount, :concept, :date, :kind, :account_id)
  end
end
