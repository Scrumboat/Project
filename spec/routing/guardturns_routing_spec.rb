require "spec_helper"

describe GuardturnsController do
  describe "routing" do

    it "routes to #index" do
      get("/guardturns").should route_to("guardturns#index")
    end

    it "routes to #new" do
      get("/guardturns/new").should route_to("guardturns#new")
    end

    it "routes to #show" do
      get("/guardturns/1").should route_to("guardturns#show", :id => "1")
    end

    it "routes to #edit" do
      get("/guardturns/1/edit").should route_to("guardturns#edit", :id => "1")
    end

    it "routes to #create" do
      post("/guardturns").should route_to("guardturns#create")
    end

    it "routes to #update" do
      put("/guardturns/1").should route_to("guardturns#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/guardturns/1").should route_to("guardturns#destroy", :id => "1")
    end

  end
end
