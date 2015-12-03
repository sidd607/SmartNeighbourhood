class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :user_profile_complete, :find_profile, :get_notify

  def create
    @post = Post.find(params[:post_id])
    #@comment = @post.comments.create!(params[:comment])
    options_of_post = ["blogs", "forums", "Announcements", "Complaints"]
    @comment = @post.comments.create!(params.require(:comment).permit(:description, :profile_id, :post_id, :report))
    if @post.profile_id != @comment.profile_id
      @notification = Notification.create
      @notification.created_by = @post.profile_id
      @notification.responded_by = @current_profile.id
      @notification.post_id = @post.id
      @notification.notification_type = @post.data_type
      @notification.view_stat = 0
      @notification.message = @current_profile.firstName + "(profile_id: " + @current_profile.id.to_s +
          ")" + "Commented on your " + options_of_post[@post.data_type - 1] + "(Post_id:" + @post.id.to_s + ")"
      @notification.save
    end
    @noti_comment = Comment.where("post_id = ?", @post.id)
    @noti_comment.each do |comm|
      if @post.profile_id != comm.profile_id and @comment.profile_id != comm.profile_id
        @notification = Notification.create
        @notification.created_by = comm.profile_id
        @notification.responded_by = @current_profile.id
        @notification.post_id = @post.id
        @notification.notification_type = @post.data_type
        @notification.message = @current_profile.firstName + "(profile_id: " + @current_profile.id.to_s +
            ")" + "Commented on a " + options_of_post[@post.data_type - 1] + "(Post_id:" + @post.id.to_s + ") you have commented on"
        @notification.view_stat = 0
        @notification.save
      end
    end
    redirect_to @post
  end

  def getUser
    @profile = Profile.find(@comment.profile_id)
    return @profile.firstName
  end

  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end



end