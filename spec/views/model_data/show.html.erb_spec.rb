require 'spec_helper'

describe "model_data/show" do
  before(:each) do
    @model_datum = assign(:model_datum, stub_model(ModelDatum,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/String1/)
    rendered.should match(/String2/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
