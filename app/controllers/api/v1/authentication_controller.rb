# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < ApplicationController
      skip_before_action :authenticate_request, only: %i[login register]

      # POST /auth/login
      def login
        @user = User.find_by(email: params[:email])
        if @user&.authenticate(params[:password])
          token = jwt_encode(user_id: @user.id)
          render json: { token: token }, status: :ok
        else
          render json: { errors: I18n.t('user.bad_credentials') }, status: :bad_request
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
        params.permit(:email, :password, :first_name, :last_name, :rol)
      end
    end
  end
end
