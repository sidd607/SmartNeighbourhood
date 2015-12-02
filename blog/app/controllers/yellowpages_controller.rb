class YellowpagesController < ApplicationController
  before_action :set_yellowpage, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :user_profile_complete, :find_user, :find_current

  # GET /yellowpages
  # GET /yellowpages.json
  def index
    @yellowpages = Yellowpage.all
  end

  # GET /yellowpages/1
  # GET /yellowpages/1.json
  def show
    @rating = Rating.new
  end

  # GET /yellowpages/new
  def new
    @yellowpage = Yellowpage.new
  end

  # GET /yellowpages/1/edit
  def edit
  end





  # POST /yellowpages
  # POST /yellowpages.json

  def create
    @yellowpage = Yellowpage.new(yellowpage_params)
    @yellowpage.profile_id = @profile.id
    @yellowpage.totalRatings = 1
    @yellowpage.totalRatings = 1
    @yellowpage.community_id = @profile.community_id
    @yellowpage.verified = 0

    respond_to do |format|
      if @yellowpage.save
        format.html { redirect_to @yellowpage, notice: 'Yellowpage was successfully created.' }
        format.json { render :show, status: :created, location: @yellowpage }
      else
        format.html { render :new }
        format.json { render json: @yellowpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yellowpages/1
  # PATCH/PUT /yellowpages/1.json
  def update
    respond_to do |format|
      if @yellowpage.update(yellowpage_params)
        format.html { redirect_to @yellowpage, notice: 'Yellowpage was successfully updated.' }
        format.json { render :show, status: :ok, location: @yellowpage }
      else
        format.html { render :edit }
        format.json { render json: @yellowpage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yellowpages/1
  # DELETE /yellowpages/1.json
  def destroy
    @yellowpage.destroy
    respond_to do |format|
      format.html { redirect_to yellowpages_url, notice: 'Yellowpage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def rate
    #@user = User.find(session[:user_id])
    #@current_profile = Profile.find_by_email(@user.email)
    #if @current_profile.id != @yellowpage.profile_id
    #@rating = Rating.where("profile_id = ? AND post_id = ?", @current_profile.id, @yellowpage.id)
    #if @rating = nil
      @rating = Rating.new
      @rating.post_id = @yellowpage.id
      @rating.profile_id = @current_user.id
      @rating.save
    respond_to do |format|
      if @rating.save
        format.html { redirect_to @yellowpage, notice: 'Yellowpage was successfully rated.' }
        format.json { render :show, status: :ok, location: @yellowpage }
      end
    end
  end
    #end

  def set_yellowpage
    @yellowpage = Yellowpage.find(params[:id])

  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def yellowpage_params
    params.require(:yellowpage).permit(:profile_id, :name, :phone, :address, :description, :rating, :community_id, :AveRating, :totalRatings)
  end

  def find_user
    @user = User.find(session[:user_id])
    @profile = Profile.find_by_email(@user.email)
  end

  def find_current
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end
end

