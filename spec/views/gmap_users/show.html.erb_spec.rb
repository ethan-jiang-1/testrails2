require 'spec_helper'

describe "gmap_users/show" do
  before(:each) do
    @gmap_user = assign(:gmap_user, stub_model(GmapUser))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
