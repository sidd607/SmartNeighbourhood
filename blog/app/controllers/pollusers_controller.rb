class PollusersController < ApplicationController
  before_action :set_polluser, only: [:show, :edit, :update, :destroy]

  # GET /pollusers
  # GET /pollusers.json
  def index
    @pollusers = Polluser.all
  end

  # GET /pollusers/1
  # GET /pollusers/1.json
  def show
  end

  # GET /pollusers/new
  def new
    @polluser = Polluser.new
  end

  # GET /pollusers/1/edit
  def edit
  end

  # POST /pollusers
  # POST /pollusers.json
  def create
    @polluser = Polluser.new(polluser_params)

    respond_to do |format|
      if @polluser.save
        format.html { redirect_to @polluser, notice: 'Polluser was successfully created.' }
        format.json { render :show, status: :created, location: @polluser }
      else
        format.html { render :new }
        format.json { render json: @polluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pollusers/1
  # PATCH/PUT /pollusers/1.json
  def update
    respond_to do |format|
      if @polluser.update(polluser_params)
        format.html { redirect_to @polluser, notice: 'Polluser was successfully updated.' }
        format.json { render :show, status: :ok, location: @polluser }
      else
        format.html { render :edit }
        format.json { render json: @polluser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pollusers/1
  # DELETE /pollusers/1.json
  def destroy
    @polluser.destroy
    respond_to do |format|
      format.html { redirect_to pollusers_url, notice: 'Polluser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polluser
      @polluser = Polluser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def polluser_params
      params.require(:polluser).permit(:poll_id, :user_id, :optionSelected)
    end
end
