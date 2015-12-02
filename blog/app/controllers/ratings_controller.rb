class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :user_profile_complete, :find_profile

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        @yello = Yellowpage.find(@rating.post_id)
        @yello.AveRating = (@yello.AveRating + @rating.rate)/(@yello.totalRatings + 1)
        @yello.totalRatings += 1
        @yello.save
        @post = @yello
        @post = Post.find(@rating.post_id)
        @notification = Notification.create
        @notification.created_by = @post.profile_id
        #@notification.responded_by = @rating.profile_id
        @notification.post_id = @post.id
        @notification.notification_type = 5 + @post.data_type
        @notification.view_stat = 0
        options_of_post = ["blogs", "forums", "Announcements", "Complaints"]
          @notification.message = @current_profile.firstName + "(profile_id: " + @current_profile.id.to_s +
            ")" + "Rated your " + options_of_post[@post.data_type - 6] + "(Post_id:" + ")"
        @notification.save
        format.html { redirect_to @yello, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rating
    @rating = Rating.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:post_id, :profile_id, :rate, :rated_at, :type, :Description)
  end
  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end
end