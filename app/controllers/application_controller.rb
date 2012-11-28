class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :prepare_for_mobile_devices

  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS|iPhone/
    end
  end

  def tablet_device?
    if session[:tablet_param]
      session[:tablet_param] == "1"
    else
      request.user_agent =~ /iPad|tablet|kindle|playbook/
    end
  end

  helper_method :mobile_device?
  helper_method :tablet_device?

  def prepare_for_mobile_devices
    session[:mobile_param] = params[:mobile] if params[:mobile]
    session[:tablet_param] = params[:tablet] if params[:tablet]
    request.format = :mobile if mobile_device?
    request.format = :tablet if tablet_device?
  end
end
