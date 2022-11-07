class ApplicationController < ActionController::API
  include JsonWebToken
  include Pagy::Backend

  before_action :switch_locale
  before_action :authenticate_request

  def switch_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded = jwt_decode(header)
    @current_user = User.find(decoded[:user_id])
  end
end
