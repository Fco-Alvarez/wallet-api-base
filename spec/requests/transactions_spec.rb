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

RSpec.describe "/transactions", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Transaction. As you add validations to Transaction, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # TransactionsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Transaction.create! valid_attributes
      get api_v1_transactions_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it "returns values based on scopes" do
      
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      transaction = Transaction.create! valid_attributes
      get api_v1_transaction_url(transaction), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Transaction" do
        expect {
          post api_v1_transactions_url,
               params: { transaction: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Transaction, :count).by(1)
      end

      it "renders a JSON response with the new transaction" do
        post api_v1_transactions_url,
             params: { transaction: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Transaction" do
        expect {
          post api_v1_transactions_url,
               params: { transaction: invalid_attributes }, as: :json
        }.to change(Transaction, :count).by(0)
      end

      it "renders a JSON response with errors for the new transaction" do
        post api_v1_transactions_url,
             params: { transaction: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested transaction" do
        transaction = Transaction.create! valid_attributes
        patch api_v1_transaction_url(transaction),
              params: { transaction: new_attributes }, headers: valid_headers, as: :json
        transaction.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the transaction" do
        transaction = Transaction.create! valid_attributes
        patch api_v1_transaction_url(transaction),
              params: { transaction: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the transaction" do
        transaction = Transaction.create! valid_attributes
        patch api_v1_transaction_url(transaction),
              params: { transaction: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested transaction" do
      transaction = Transaction.create! valid_attributes
      expect {
        delete api_v1_transaction_url(transaction), headers: valid_headers, as: :json
      }.to change(Transaction, :count).by(-1)
    end
  end
end
