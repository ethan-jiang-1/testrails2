require "spec_helper"

describe GmapUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/gmap_users").should route_to("gmap_users#index")
    end

    it "routes to #new" do
      get("/gmap_users/new").should route_to("gmap_users#new")
    end

    it "routes to #show" do
      get("/gmap_users/1").should route_to("gmap_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gmap_users/1/edit").should route_to("gmap_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gmap_users").should route_to("gmap_users#create")
    end

    it "routes to #update" do
      put("/gmap_users/1").should route_to("gmap_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gmap_users/1").should route_to("gmap_users#destroy", :id => "1")
    end

  end
end
