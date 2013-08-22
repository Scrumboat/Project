require "spec_helper"

describe GuardseasonsController do
  describe "routing" do

    it "routes to #index" do
      get("/guardseasons").should route_to("guardseasons#index")
    end

    it "routes to #new" do
      get("/guardseasons/new").should route_to("guardseasons#new")
    end

    it "routes to #show" do
      get("/guardseasons/1").should route_to("guardseasons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/guardseasons/1/edit").should route_to("guardseasons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/guardseasons").should route_to("guardseasons#create")
    end

    it "routes to #update" do
      put("/guardseasons/1").should route_to("guardseasons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/guardseasons/1").should route_to("guardseasons#destroy", :id => "1")
    end

  end
end
