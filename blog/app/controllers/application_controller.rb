class ApplicationController < ActionController::Base
  #before_filter :find_profile, :get_notify
  
  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end

  def get_notify
    @user = User.find(session[:user_id])
    @cur_profile = Profile.find_by_email(@user.email)
    if @cur_profile != nil
      if @cur_profile.verified != 2
        @notifications =  Notification.where("(created_by = ? and (notification_type < ? or notification_type = ?)) or (responded_by = ? and notification_type = ?)", @cur_profile.id, 5,6, @cur_profile.community_id, 5).order('notifications.created_at desc')
      else
        @notifications =  Notification.where("(created_by = ? and (notification_type < ? or notification_type = ?)) or (responded_by = ? and (notification_type = ? or notification_type = ?))", @cur_profile.id, 5,6, @cur_profile.community_id, 5,7).order('notifications.created_at desc')
      end
    end
    if @notifications == nil
      @count_not = 0
    else
      @count_not = @notifications.count
    end
    #@count_not = @notifications.count
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, notice: "Not authorized" if current_user.nil?
  end

  def is_verified
    @user = User.find(session[:user_id])
    @currentprofile = Profile.find_by_email(@user.email)
    redirect_to "/notverified.html", notice: "Not authorized" if @currentprofile.verified == 0
  end

  def logged_in
    if session[:user_id] != nil
      redirect_to root_url, notice: "Already logged in"
    end
  end

  def user_profile_complete
    redirect_to createprofile_url, notice: "Please complete your profile" if current_user.profile_complete == 0
  end

  private

  @base_url = "http://127.0.0.1:3000"
end
