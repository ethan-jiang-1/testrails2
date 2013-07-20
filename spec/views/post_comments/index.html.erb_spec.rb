require 'spec_helper'

describe "post_comments/index" do
  before(:each) do
    assign(:post_comments, [
      stub_model(PostComment,
        :content => "Content"
      ),
      stub_model(PostComment,
        :content => "Content"
      )
    ])
  end

  it "renders a list of comments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
  end
end
