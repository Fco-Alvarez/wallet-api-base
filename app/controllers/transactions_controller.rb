class TransactionsController < ApplicationController
  has_scope :by_concept
  has_scope :by_type
  has_scope :by_account

  def index
    @transtactions = apply_scopes(Transaction.all)
  end

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save(context: :create_from_controller)
      render json: @transaction, status: :created, location: @transaction
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
    params.require(:transaction).permit(:amount, :concept, :date, :kind, :account_id, :user_id)
  end
end
