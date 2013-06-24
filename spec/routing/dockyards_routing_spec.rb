require "spec_helper"

describe DockyardsController do
  describe "routing" do

    it "routes to #index" do
      get("/dockyards").should route_to("dockyards#index")
    end

    it "routes to #new" do
      get("/dockyards/new").should route_to("dockyards#new")
    end

    it "routes to #show" do
      get("/dockyards/1").should route_to("dockyards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dockyards/1/edit").should route_to("dockyards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dockyards").should route_to("dockyards#create")
    end

    it "routes to #update" do
      put("/dockyards/1").should route_to("dockyards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dockyards/1").should route_to("dockyards#destroy", :id => "1")
    end

  end
end
