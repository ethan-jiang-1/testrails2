require 'spec_helper'

describe "model_data/new" do
  before(:each) do
    assign(:model_datum, stub_model(ModelDatum,
      :boolean1 => false,
      :boolean2 => false,
      :decimal1 => "9.99",
      :decimal2 => "9.99",
      :float1 => 1.5,
      :float2 => 1.5,
      :integer1 => 1,
      :integer2 => 1,
      :string1 => "MyString",
      :string2 => "MyString",
      :text1 => "MyText",
      :text2 => "MyText"
    ).as_new_record)
  end

  it "renders new model_datum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", model_data_path, "post" do
      assert_select "input#model_datum_boolean1[name=?]", "model_datum[boolean1]"
      assert_select "input#model_datum_boolean2[name=?]", "model_datum[boolean2]"
      assert_select "input#model_datum_decimal1[name=?]", "model_datum[decimal1]"
      assert_select "input#model_datum_decimal2[name=?]", "model_datum[decimal2]"
      assert_select "input#model_datum_float1[name=?]", "model_datum[float1]"
      assert_select "input#model_datum_float2[name=?]", "model_datum[float2]"
      assert_select "input#model_datum_integer1[name=?]", "model_datum[integer1]"
      assert_select "input#model_datum_integer2[name=?]", "model_datum[integer2]"
      assert_select "input#model_datum_string1[name=?]", "model_datum[string1]"
      assert_select "input#model_datum_string2[name=?]", "model_datum[string2]"
      assert_select "textarea#model_datum_text1[name=?]", "model_datum[text1]"
      assert_select "textarea#model_datum_text2[name=?]", "model_datum[text2]"
    end
  end
end
