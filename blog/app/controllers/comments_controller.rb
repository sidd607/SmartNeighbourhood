class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :user_profile_complete, :find_profile

  def create
    @post = Post.find(params[:post_id])
    #@comment = @post.comments.create!(params[:comment])
    @comment = @post.comments.create!(params.require(:comment).permit(:description, :profile_id, :post_id, :report))


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
