require 'spec_helper'

describe "gmap_users/new" do
  before(:each) do
    assign(:gmap_user, stub_model(GmapUser).as_new_record)
  end

  it "renders new gmap_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gmap_users_path, :method => "post" do
    end
  end
end
