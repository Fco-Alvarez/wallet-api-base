# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      def index
        if @current_user.rol == 'admin'
          @accounts = Account.all.order(id: :desc)
          render :index, status: :ok
        else
          render json: { errors: 'No eres Admin' }, status: :bad_request
        end
      end
    end
  end
end
