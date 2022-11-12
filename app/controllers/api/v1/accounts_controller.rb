# frozen_string_literal: true

module Api
  module V1
    class AccountsController < ApplicationController
      def index
        @accounts = @current_user.accounts
        render :index, status: :ok
      end
    end
  end
end
