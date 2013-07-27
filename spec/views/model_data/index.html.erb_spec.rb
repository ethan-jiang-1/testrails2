require 'spec_helper'

describe "model_data/index" do
  before(:each) do
    assign(:model_data, [
      stub_model(ModelDatum,
        :boolean1 => false,
        :boolean2 => false,
        :decimal1 => "9.99",
        :decimal2 => "9.99",
        :float1 => 1.5,
        :float2 => 1.5,
        :integer1 => 1,
        :integer2 => 2,
        :string1 => "String1",
        :string2 => "String2",
        :text1 => "MyText",
        :text2 => "MyText"
      ),
      stub_model(ModelDatum,
        :boolean1 => false,
        :boolean2 => false,
        :decimal1 => "9.99",
        :decimal2 => "9.99",
        :float1 => 1.5,
        :float2 => 1.5,
        :integer1 => 1,
        :integer2 => 2,
        :string1 => "String1",
        :string2 => "String2",
        :text1 => "MyText",
        :text2 => "MyText"
      )
    ])
  end

  it "renders a list of model_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "String1".to_s, :count => 2
    assert_select "tr>td", :text => "String2".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
