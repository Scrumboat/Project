require "spec_helper"

describe BoatsMembersController do
  describe "routing" do

    it "routes to #index" do
      get("/boats_members").should route_to("boats_members#index")
    end

    it "routes to #new" do
      get("/boats_members/new").should route_to("boats_members#new")
    end

    it "routes to #show" do
      get("/boats_members/1").should route_to("boats_members#show", :id => "1")
    end

    it "routes to #edit" do
      get("/boats_members/1/edit").should route_to("boats_members#edit", :id => "1")
    end

    it "routes to #create" do
      post("/boats_members").should route_to("boats_members#create")
    end

    it "routes to #update" do
      put("/boats_members/1").should route_to("boats_members#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/boats_members/1").should route_to("boats_members#destroy", :id => "1")
    end

  end
end
