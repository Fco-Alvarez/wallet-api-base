class UsersController < ApplicationController
  #before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid email or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password_digest])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  def balance
    amount = @user.account_balance(currency_param)
    balance = { currency: currency_param, amount: amount }
    render json: { balance: balance }
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:email, :password_digest, :first_name, :last_name, :id, :rol )
  end

  def currency_param
    params.permit(:currency)
  end
end