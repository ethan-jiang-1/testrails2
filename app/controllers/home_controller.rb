class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.mobile { redirect_to mobile_index_path }
    end
  end

  def search
  end

  def environment
  end

  def routes
  end
end
