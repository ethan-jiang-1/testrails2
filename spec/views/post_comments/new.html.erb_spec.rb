require 'spec_helper'

describe "post_comments/new" do
  before(:each) do
    assign(:post_comment, stub_model(PostComment,
      :content => "MyString"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #
    # todo: Yizhen - comment out - we are using ajax now instead of static page
    #
    #assert_select "form", :action => comments_path, :method => "post" do
    #  assert_select "input#comment_content", :name => "comment[content]"
    #end
  end
end
