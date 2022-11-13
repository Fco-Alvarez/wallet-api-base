# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'user', type: :request do
  let(:secret_key) { @secret_key = Rails.application.secrets.secret_key_base }
  let(:new_user) { create(:user) }
  let(:user_token) { JWT.encode({ user_id: new_user.id }, secret_key) }

  it 'creates a user' do
    params = { email: Faker::Internet.email, password: 'password', rol: 'admin', first_name: 'usuario',
               last_name: 'prueba' }
    post api_v1_auth_register_url, params: params, headers: {}, as: :json
    expect(response).to have_http_status(:created)
  end

  it 'logins' do
    params = { email: new_user.email, password: new_user.password, first_name: new_user.first_name,
               last_name: new_user.last_name, rol: new_user.rol }
    post api_v1_auth_login_url, params: params
    expect(response).to have_http_status(:ok)
  end

  it 'shows a user' do
    get api_v1_user_url(id: new_user), headers: { Authorization: user_token }, as: :json
    expect(response).to have_http_status(:ok)
  end

  it 'lists all users' do
    get api_v1_users_url, headers: { Authorization: user_token }, as: :json
    expect(response).to have_http_status(:ok)
  end

  it 'destroys user' do
    delete api_v1_user_url(id: new_user), headers: { Authorization: user_token }, as: :json
    expect(response).to have_http_status(:no_content)
  end

  it "gets user's balance"
  # it "gets user's balance" do
  #   get api_v1_balance_url(id: new_user), headers: { Authorization: user_token }, as: :json
  #   expect(response).to have_http_status(:balance)
  # end
end
