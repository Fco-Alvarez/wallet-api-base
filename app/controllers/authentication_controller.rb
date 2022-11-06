class AuthenticationController < ApplicationController

  skip_before_action :authenticate_request, only: %i[login register]

  # POST /auth/login
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { errors: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # /auth/register
  def register
    @user = User.create(user_params)
    if @user.valid?
      token = jwt_encode(user_id: @user.id)
      render json: { user: @user, token: token }, status: :created
    else
      render json: { errors: @user.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :first_name, :last_name, :id, :rol)
  end
end
