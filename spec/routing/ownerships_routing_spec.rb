require "spec_helper"

describe OwnershipsController do
  describe "routing" do

    it "routes to #index" do
      get("/ownerships").should route_to("ownerships#index")
    end

    it "routes to #new" do
      get("/ownerships/new").should route_to("ownerships#new")
    end

    it "routes to #show" do
      get("/ownerships/1").should route_to("ownerships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ownerships/1/edit").should route_to("ownerships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ownerships").should route_to("ownerships#create")
    end

    it "routes to #update" do
      put("/ownerships/1").should route_to("ownerships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ownerships/1").should route_to("ownerships#destroy", :id => "1")
    end

  end
end
