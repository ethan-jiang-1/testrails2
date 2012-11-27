include ApplicationHelper

class SimpleSessionController < ApplicationController
  def new
    simple_sign_in "abc"
    redirect_to root_path
  end

  def destroy
    simple_sign_out
    redirect_to root_path
  end

end
