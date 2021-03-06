class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :user_profile_complete, :define_type, :find_user, :find_profile, :get_notify, :is_verified

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.search(params[:search]).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /posts/1
  # GET /posts/1.json

  def show
  end

  # GET /posts/new
  def new
    @post = Post.new(data_type: params[:data_type])
    puts "This is awesome"
    puts @data_type
  end

  def newBlog #controller function for creating a new blog
    if @profile.verified==0
      redirect_to blogs_url, notice: 'You are not allowed to create a post until you are verified'
    end
    @post = Post.new
  end

  def newAnnouncement #controller function for creating a new Announcement
    if @profile.verified==0
      redirect_to announcements_url, notice: 'You are not allowed to create a post until you are verified'
    end
    @post = Post.new
  end

  def newForum #controller function for creating a new Forum
    if @profile.verified==0
      redirect_to forums_url, notice: 'You are not allowed to create a post until you are verified'
    end
    @post = Post.new
  end

  def newComplain #Comtroller function for Creating a New Forum
    if @profile.verified==0
      redirect_to complains_url, notice: 'You are not allowed to create a post until you are verified'
    end
    @post = Post.new
  end



  def blogs #displaying all the blogs of the users community_id
    if params[:tag]
      @posts = Post.where(data_type:1, community_id:@profile.community_id).tagged_with(params[:tag])
    else
      @posts = Post.where(data_type:1, community_id:@profile.community_id)
    end
  end

  def forums #displaying all the forum of the users community_id
    @posts = Post.where(data_type:2, community_id:@profile.community_id)
  end

  def announcements #displaying all the announcements of the users community_id
    @ann = Post.where(data_type:3, community_id:@profile.community_id)
  end

  def complains #displaying all the announcements of the users community_id
    @posts = Post.where(data_type:4, community_id:@profile.community_id)
  end


  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @user = User.find(session[:user_id])
    @profile = Profile.find_by_email(@user.email)
    @post.community_id = @profile.community_id
    @post.profile_id = @profile.id
    @post.priority = 0
    @post.report = 0
    @post.rating = 0
    @post.rateCount = 0
    respond_to do |format|
      if @post.save
        if @post.data_type == 3
          @notification = Notification.create
          @notification.created_by = @post.profile_id
          @notification.responded_by = @profile.community_id
          @notification.post_id = @post.id
          @notification.notification_type = 5
          @notification.view_stat = 0
          @notification.message = "New Announcement by " + @profile.firstName + "(profile_id:" + @profile.id.to_s + ")"
          @notification.save
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "post Deleted"
  end



  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body ,:data_type, :tag_list)
    end

    def define_type
      @data_type = params[:data_type]
    end

    def find_user
      @user = User.find(session[:user_id])
      @profile = Profile.find_by_email(@user.email)
    end

end
