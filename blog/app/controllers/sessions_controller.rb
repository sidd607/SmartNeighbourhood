class SessionsController < ApplicationController
  before_filter :logged_in, :except => :destroy
  layout false
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      @profile = Profile.find_by_email(user.email)
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        if user.profile_complete == 1
          redirect_to @profile, notice: "Successfully Logged In"
        else
          redirect_to createprofile_url
        end
      else
        flash.now.alert = "Password Invalid"
        render "new"
      end
    else
      flash.now.alert = "Email Invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged Out"
  end

end
