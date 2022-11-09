class Api::V1::AccountsController < ApplicationController
  def index
    @accounts = @current_user.accounts
    render :index, status: :ok
  end
end
