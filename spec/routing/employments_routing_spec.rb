require "spec_helper"

describe EmploymentsController do
  describe "routing" do

    it "routes to #index" do
      get("/employments").should route_to("employments#index")
    end

    it "routes to #new" do
      get("/employments/new").should route_to("employments#new")
    end

    it "routes to #show" do
      get("/employments/1").should route_to("employments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employments/1/edit").should route_to("employments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employments").should route_to("employments#create")
    end

    it "routes to #update" do
      put("/employments/1").should route_to("employments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employments/1").should route_to("employments#destroy", :id => "1")
    end

  end
end
