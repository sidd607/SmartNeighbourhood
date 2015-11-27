class ApplicationController < ActionController::Base

  private

  @base_url = "http://127.0.0.1:3000"
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end

  def logged_in
    if session[:user_id] != nil
      redirect_to root_url, notice: "Already logged in"
    end
  end

  def user_profile_complete
    redirect_to createprofile_url, notice: "Please complete your profile" if current_user.profile_complete == 0
  end
end
