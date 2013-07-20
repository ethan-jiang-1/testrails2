require 'spec_helper'

describe "post_comments/edit" do
  before(:each) do
    @comment = assign(:post_comment, stub_model(PostComment,
      :content => "MyString"
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #
    # todo: Yizhen - comment out - we are using ajax now instead of static page
    #
    #assert_select "form", :action => comments_path(@comment), :method => "post" do
    #  assert_select "input#comment_content", :name => "comment[content]"
    #end
  end
end
