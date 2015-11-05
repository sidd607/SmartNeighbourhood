class PolloptionsController < ApplicationController
  before_action :set_polloption, only: [:show, :edit, :update, :destroy]

  # GET /polloptions
  # GET /polloptions.json
  def index
    @polloptions = Polloption.all
  end

  # GET /polloptions/1
  # GET /polloptions/1.json
  def show
  end

  # GET /polloptions/new
  def new
    @polloption = Polloption.new
  end

  # GET /polloptions/1/edit
  def edit
  end

  # POST /polloptions
  # POST /polloptions.json
  def create
    @polloption = Polloption.new(polloption_params)

    respond_to do |format|
      if @polloption.save
        format.html { redirect_to @polloption, notice: 'Polloption was successfully created.' }
        format.json { render :show, status: :created, location: @polloption }
      else
        format.html { render :new }
        format.json { render json: @polloption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polloptions/1
  # PATCH/PUT /polloptions/1.json
  def update
    respond_to do |format|
      if @polloption.update(polloption_params)
        format.html { redirect_to @polloption, notice: 'Polloption was successfully updated.' }
        format.json { render :show, status: :ok, location: @polloption }
      else
        format.html { render :edit }
        format.json { render json: @polloption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polloptions/1
  # DELETE /polloptions/1.json
  def destroy
    @polloption.destroy
    respond_to do |format|
      format.html { redirect_to polloptions_url, notice: 'Polloption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polloption
      @polloption = Polloption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def polloption_params
      params.require(:polloption).permit(:poll_id, :option, :description, :votecount)
    end
end
