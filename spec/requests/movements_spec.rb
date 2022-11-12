# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe 'movements', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # movement. As you add validations to movement, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # movementsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Movement.create! valid_attributes
      get api_v1_movements_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'returns values based on scopes' do
      pending 'pending task'
      this_should_not_get_executed
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      movement = Movement.create! valid_attributes
      get api_v1_movement_url(movement), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new movement' do
        expect do
          post api_v1_movements_url,
               params: { movement: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Movement, :count).by(1)
      end

      it 'renders a JSON response with the new movement' do
        post api_v1_movements_url,
             params: { movement: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new movement' do
        expect do
          post api_v1_movements_url,
               params: { movement: invalid_attributes }, as: :json
        end.not_to change(Movement, :count)
      end

      it 'renders a JSON response with errors for the new movement' do
        post api_v1_movements_url,
             params: { movement: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested movement' do
        movement = movement.create! valid_attributes
        patch api_v1_movement_url(movement),
              params: { movement: new_attributes }, headers: valid_headers, as: :json
        movement.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the movement' do
        movement = movement.create! valid_attributes
        patch api_v1_movement_url(movement),
              params: { movement: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the movement' do
        movement = movement.create! valid_attributes
        patch api_v1_movement_url(movement),
              params: { movement: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested movement' do
      movement = movement.create! valid_attributes
      expect do
        delete api_v1_movement_url(movement), headers: valid_headers, as: :json
      end.to change(Movement, :count).by(-1)
    end
  end
end
