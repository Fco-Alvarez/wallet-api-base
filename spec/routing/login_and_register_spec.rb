# frozen_string_literal: true

require 'rails_helper'

describe 'Routes the login and registration' do
  it 'User registration' do
    expect(post: '/api/v1/auth/register').to route_to(
      format: 'json',
      controller: 'api/v1/authentication',
      action: 'register'
    )
  end

  it 'User login' do
    expect(post: '/api/v1/auth/login').to route_to(
      format: 'json',
      controller: 'api/v1/authentication',
      action: 'login'
    )
  end
end
