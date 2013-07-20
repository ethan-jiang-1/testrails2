require "spec_helper"

describe PostCommentsController do
  describe "routing" do

    it "routes to #index" do
      get("/post_comments").should route_to("post_comments#index")
    end

    it "routes to #new" do
      get("/post_comments/new").should route_to("post_comments#new")
    end

    it "routes to #show" do
      get("/post_comments/1").should route_to("post_comments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/post_comments/1/edit").should route_to("post_comments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/post_comments").should route_to("post_comments#create")
    end

    it "routes to #update" do
      put("/post_comments/1").should route_to("post_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/post_comments/1").should route_to("post_comments#destroy", :id => "1")
    end

  end
end
