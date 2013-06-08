require "spec_helper"

describe DocksController do
  describe "routing" do

    it "routes to #index" do
      get("/docks").should route_to("docks#index")
    end

    it "routes to #new" do
      get("/docks/new").should route_to("docks#new")
    end

    it "routes to #show" do
      get("/docks/1").should route_to("docks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/docks/1/edit").should route_to("docks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/docks").should route_to("docks#create")
    end

    it "routes to #update" do
      put("/docks/1").should route_to("docks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/docks/1").should route_to("docks#destroy", :id => "1")
    end

  end
end
