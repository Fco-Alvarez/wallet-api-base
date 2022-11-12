# frozen_string_literal: true

require 'rails_helper'

describe 'Routes of the accounts' do
  it 'Route index' do
    expect(get: '/api/v1/accounts').to route_to(
      format: 'json',
      controller: 'api/v1/accounts',
      action: 'index'
    )
  end
end
