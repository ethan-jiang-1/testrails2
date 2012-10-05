require 'spec_helper'

describe "home/index.html.erb" do
  #render_views

  #TODO: Yizhen how come i need to specify the DSL here but not system by default?
  #..is that have something to-do with the host? such as view?  the DSL can be inject due to render view?
  include Capybara::DSL

  describe "GET /" do
    it "should have right html title" do
      visit root_path
      #page.should have_content('Test Rails Home Page')
      #page.should have_xpath("//title", :text => "Test Rails Home Page")

      heading1_title = "Test Rails Home Page"
      page.should have_content(heading1_title)
      page.should have_xpath("//h1", :text => heading1_title)
    end
  end
end
