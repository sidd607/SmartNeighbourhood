class YellowpagesController < ApplicationController
  before_action :set_yellowpage, only: [:show, :edit, :update, :destroy]

  # GET /yellowpages
  # GET /yellowpages.json
  def index
    @yellowpages = Yellowpage.all
  end

  # GET /yellowpages/1
  # GET /yellowpages/1.json
  def show
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
    def set_yellowpage
      @yellowpage = Yellowpage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yellowpage_params
      params.require(:yellowpage).permit(:user_id, :name, :phone, :address, :description, :verified, :community_id, :AveRating, :totalRatings)
    end
end
