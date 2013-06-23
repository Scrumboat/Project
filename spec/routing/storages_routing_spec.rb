require "spec_helper"

describe StoragesController do
  describe "routing" do

    it "routes to #index" do
      get("/storages").should route_to("storages#index")
    end

    it "routes to #new" do
      get("/storages/new").should route_to("storages#new")
    end

    it "routes to #show" do
      get("/storages/1").should route_to("storages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/storages/1/edit").should route_to("storages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/storages").should route_to("storages#create")
    end

    it "routes to #update" do
      put("/storages/1").should route_to("storages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/storages/1").should route_to("storages#destroy", :id => "1")
    end

  end
end
