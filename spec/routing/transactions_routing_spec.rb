require "rails_helper"

RSpec.describe Api::V1::TransactionsController, type: :routing do
  describe "Routing transactions" do
    it "routes to #index" do
      expect(get: "/api/v1/transactions").to route_to(
        format: 'json',
        controller: 'api/v1/transactions',
        action: 'index'
      )
    end

    it "routes to #show" do
      expect(get: "/api/v1/transactions/1").to route_to(
        format: 'json',
        controller: 'api/v1/transactions',
        action: 'show',
        id: '1'
      )
    end

    it "routes to #create" do
      expect(post: "/api/v1/transactions").to route_to(
        format: 'json',
        controller: 'api/v1/transactions',
        action: 'create'
      )
    end

    # it "routes to #update via PUT" do
    #   expect(put: "/transactions/1").to route_to("transactions#update", id: "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(patch: "/transactions/1").to route_to("transactions#update", id: "1")
    # end

    # it "routes to #destroy" do
    #   expect(delete: "/transactions/1").to route_to("transactions#destroy", id: "1")
    # end
  end
end
