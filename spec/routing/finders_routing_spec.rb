require "rails_helper"

RSpec.describe FindersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/finders").to route_to("finders#index")
    end

    it "routes to #new" do
      expect(get: "/finders/new").to route_to("finders#new")
    end

    it "routes to #show" do
      expect(get: "/finders/1").to route_to("finders#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/finders/1/edit").to route_to("finders#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/finders").to route_to("finders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/finders/1").to route_to("finders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/finders/1").to route_to("finders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/finders/1").to route_to("finders#destroy", id: "1")
    end
  end
end
