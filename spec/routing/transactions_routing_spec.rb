require "rails_helper"

RSpec.describe Api::V1::movementsController, type: :routing do
  describe "Routing movements" do
    it "routes to #index" do
      expect(get: "/api/v1/movements").to route_to(
        format: 'json',
        controller: 'api/v1/movements',
        action: 'index'
      )
    end

    it "routes to #show" do
      expect(get: "/api/v1/movements/1").to route_to(
        format: 'json',
        controller: 'api/v1/movements',
        action: 'show',
        id: '1'
      )
    end

    it "routes to #create" do
      expect(post: "/api/v1/movements").to route_to(
        format: 'json',
        controller: 'api/v1/movements',
        action: 'create'
      )
    end

    # it "routes to #update via PUT" do
    #   expect(put: "/movements/1").to route_to("movements#update", id: "1")
    # end

    # it "routes to #update via PATCH" do
    #   expect(patch: "/movements/1").to route_to("movements#update", id: "1")
    # end

    # it "routes to #destroy" do
    #   expect(delete: "/movements/1").to route_to("movements#destroy", id: "1")
    # end
  end
end
