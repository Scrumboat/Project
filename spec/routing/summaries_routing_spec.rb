require "spec_helper"

describe SummariesController do
  describe "routing" do

    it "routes to #index" do
      get("/summaries").should route_to("summaries#index")
    end

    it "routes to #new" do
      get("/summaries/new").should route_to("summaries#new")
    end

    it "routes to #show" do
      get("/summaries/1").should route_to("summaries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/summaries/1/edit").should route_to("summaries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/summaries").should route_to("summaries#create")
    end

    it "routes to #update" do
      put("/summaries/1").should route_to("summaries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/summaries/1").should route_to("summaries#destroy", :id => "1")
    end

  end
end
