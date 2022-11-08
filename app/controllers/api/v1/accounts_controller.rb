class Api::V1::AccountsController < ApplicationController
  def index
    @accounts = @current_user.accounts
    render json: @accounts, status: :ok
  end
end
