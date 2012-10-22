require 'spec_helper'

describe "gmap_users/index" do
  before(:each) do
    assign(:gmap_users, [
      stub_model(GmapUser),
      stub_model(GmapUser)
    ])
  end

  it "renders a list of gmap_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
