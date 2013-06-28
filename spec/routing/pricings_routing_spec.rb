require "spec_helper"

describe PricingsController do
  describe "routing" do

    it "routes to #index" do
      get("/pricings").should route_to("pricings#index")
    end

    it "routes to #new" do
      get("/pricings/new").should route_to("pricings#new")
    end

    it "routes to #show" do
      get("/pricings/1").should route_to("pricings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pricings/1/edit").should route_to("pricings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pricings").should route_to("pricings#create")
    end

    it "routes to #update" do
      put("/pricings/1").should route_to("pricings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pricings/1").should route_to("pricings#destroy", :id => "1")
    end

  end
end
