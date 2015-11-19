class PollsController < ApplicationController
  before_action :set_poll, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, :user_profile_complete

  # GET /polls
  # GET /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1
  # GET /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls
  # POST /polls.json
  def create
    @poll = Poll.new(poll_params)

    respond_to do |format|
      if @poll.save
        @notification = Notification.create
        @notification.created_by = @poll.profile_id
        @notification.responded_by = @poll.community_id
        @notification.post_id = @poll.post_id
        @notification.notification_type = 12
        @notification.view_stat = 0
        @notification.message = "New Poll by " + @profile.firstName + "(profile_id:" + @profile.id.to_s + ")"
        @notification.save
        format.html { redirect_to @poll, notice: 'Poll was successfully created.' }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1
  # PATCH/PUT /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: 'Poll was successfully updated.' }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1
  # DELETE /polls/1.json
  def destroy
    @poll.destroy
    respond_to do |format|
      format.html { redirect_to polls_url, notice: 'Poll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_poll
    @poll = Poll.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def poll_params
    params.require(:poll).permit(:profile_id, :post_id, :options, :user_response, :interim, :finish_time, :anonimity, :vote_type, :community_id, :restricted_id)
  end
end