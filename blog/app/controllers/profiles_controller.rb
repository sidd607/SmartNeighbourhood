class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :find_profile

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.where(community_id:@current_profile.community_id)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    if @current_profile.email != @profile.email
      redirect_to @current_profile, notice: 'Sorry! Not allowed'
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.verified = 0
    @profile.verify_id = 0
    @profile.inactive = 0
    @profile.role_id = 1
    @profile.community_id = 1
    @profile.verifytime = nil
    @user = User.find(session[:user_id])
    @profile.email = @user.email
    respond_to do |format|
      if @profile.save
        @user.profile_complete = 1
        @user.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def verify
    @profile = Profile.find(params[:profile_id])
    puts @profile.email
    @profile.verified=1
    @profile.save
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully verified.' }
      format.json { head :no_content }
    end
  end
  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    @userd = User.find_by_email(@profile.email)
    @userd.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:firstName, :LastName, :gender, :DOB, :phone, :showPhone, :door_no, :verified)
  end

  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end

end