require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :name => "Name",
        :location_id => 1
      ),
      stub_model(Company,
        :name => "Name",
        :location_id => 2
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    #assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
