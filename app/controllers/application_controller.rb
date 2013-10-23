class ApplicationController < ActionController::Base
  protect_from_forgery

    #access-current-user-in-model
  #find the practice here: http://stackoverflow.com/questions/2513383/access-current-user-in-model
  around_filter :mp_set_current_user

  def mp_set_current_user
    #User.current_user = User.find_by_id(session[:user_id])
    User.mp_set_current_user current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    User.mp_set_current_user nil
  end
end
