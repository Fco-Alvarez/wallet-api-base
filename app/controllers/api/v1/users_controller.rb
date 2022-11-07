class Api::V1::UsersController < ApplicationController

  before_action :set_user, only: %i[show destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  def balance
    amount = @user.account_balance(currency_param)
    balance = { currency: currency_param, amount: amount }
    render json: { balance: balance }
  end

  private

  def currency_param
    params.permit(:currency)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :rol)
  end
end
