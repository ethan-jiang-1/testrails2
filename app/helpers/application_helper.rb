module ApplicationHelper
  def page_title_name
        "Test Rails"
  end

  def simple_sign_in user_name
    session[:tr2_user_name] = user_name
    session[:tr2_my_cart] = "my_cart"
    cookies[:tr2_remeber_token] = "my_token"
    cookies[:tr2_goods] = "g1:g2:g3"
  end

  def simple_sign_out
    session[:tr2_user_name] = nil
    session[:tr2_my_cart] = nil
    cookies[:tr2_remeber_token] = nil
    cookies[:tr2_goods] = nil
  end

  def simple_get_usernamese
    user_name = "bbb"
    if defined? session && defined? session[:user_name]
       user_name = session[:user_name].to_s
    end
    user_name
  end
end
