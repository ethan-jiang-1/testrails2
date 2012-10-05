require 'spec_helper'

describe "home/index.html.erb" do

  #TODO: Yizhen how come i need to specify the DSL here but not system by default?
  include Capybara::DSL

  describe "GET /" do
    it "should have right html title" do
      visit root_path
      page.should have_content('Test Rail')
    end
  end
end
