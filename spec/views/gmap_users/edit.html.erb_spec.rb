require 'spec_helper'

describe "gmap_users/edit" do
  before(:each) do
    @gmap_user = assign(:gmap_user, stub_model(GmapUser))
  end

  it "renders the edit gmap_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gmap_users_path(@gmap_user), :method => "post" do
    end
  end
end
