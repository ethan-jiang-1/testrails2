require 'spec_helper'

describe "post_comments/show" do
  before(:each) do
    @comment = assign(:post_comment, stub_model(PostComment,
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
  end
end
