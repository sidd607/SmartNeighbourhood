class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :user_profile_complete, :find_profile,  :get_notify
  before_filter :if_admin, :except => :create

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.where(community_id:@current_profile.community_id)
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  # def new
  #   @report = Report.new
  # end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  # def create
  #   @report = Report.new(report_params)
  #
  #   respond_to do |format|
  #     if @report.save
  #       format.html { redirect_to @report, notice: 'Report was successfully created.' }
  #       format.json { render :show, status: :created, location: @report }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @report.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @post = Post.find(params[:post_id])
    options_of_post = ["blogs", "forums", "Announcements", "Complaints"]
    @report = @post.reports.create!(params.require(:report).permit(:reason, :data_type, :profile_id, :post_id, :community_id))
    @report.save
    @post.report = 1
    @post.save
    @post_profile = Profile.find(@post.profile_id)
    @notification = Notification.create
    @notification.created_by = @current_profile.id
    @notification.responded_by = @post_profile.community_id
    @notification.post_id = @report.id
    @notification.notification_type = 7
    @notification.view_stat = 0
    @notification.message = @current_profile.firstName + " " + @current_profile.LastName + " Reported on " + options_of_post[@post.data_type - 1] + " of " + @post_profile.firstName + " " + @post_profile.LastName
    @notification.save
    redirect_to @post

  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    #redirect_to reports_url, notice: 'Report was successfully destroyed.'
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:profile_id, :post_id, :type, :profile_id, :reason, :reported_at)
  end

  def getUser
    @profile = Profile.find(@comment.profile_id)
    return @profile.firstName
  end

  def find_profile
    @user = User.find(session[:user_id])
    @current_profile = Profile.find_by_email(@user.email)
  end

  def if_admin
    if @current_profile.verified != 2
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'You are not admin' }
        format.json { head :no_content }
      end
    end
  end
end
