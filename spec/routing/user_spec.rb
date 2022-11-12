# frozen_string_literal: true

require 'rails_helper'

describe 'Routes of the users' do
  it 'Route index' do
    expect(get: '/api/v1/users').to route_to(
      format: 'json',
      controller: 'api/v1/users',
      action: 'index'
    )
  end

  it 'Route show' do
    expect(get: '/api/v1/users/1').to route_to(
      format: 'json',
      controller: 'api/v1/users',
      action: 'show',
      id: '1'
    )
  end
end
