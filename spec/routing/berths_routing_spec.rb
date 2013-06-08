require "spec_helper"

describe BerthsController do
  describe "routing" do

    it "routes to #index" do
      get("/berths").should route_to("berths#index")
    end

    it "routes to #new" do
      get("/berths/new").should route_to("berths#new")
    end

    it "routes to #show" do
      get("/berths/1").should route_to("berths#show", :id => "1")
    end

    it "routes to #edit" do
      get("/berths/1/edit").should route_to("berths#edit", :id => "1")
    end

    it "routes to #create" do
      post("/berths").should route_to("berths#create")
    end

    it "routes to #update" do
      put("/berths/1").should route_to("berths#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/berths/1").should route_to("berths#destroy", :id => "1")
    end

  end
end
