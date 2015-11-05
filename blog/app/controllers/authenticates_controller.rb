class AuthenticatesController < ApplicationController
  before_action :set_authenticate, only: [:show, :edit, :update, :destroy]

  # GET /authenticates
  # GET /authenticates.json
  def index
    @authenticates = Authenticate.all
  end

  # GET /authenticates/1
  # GET /authenticates/1.json
  def show
  end

  # GET /authenticates/new
  def new
    @authenticate = Authenticate.new
  end

  # GET /authenticates/1/edit
  def edit
  end

  # POST /authenticates
  # POST /authenticates.json
  def create
    @authenticate = Authenticate.new(authenticate_params)

    respond_to do |format|
      if @authenticate.save
        format.html { redirect_to @authenticate, notice: 'Authenticate was successfully created.' }
        format.json { render :show, status: :created, location: @authenticate }
      else
        format.html { render :new }
        format.json { render json: @authenticate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authenticates/1
  # PATCH/PUT /authenticates/1.json
  def update
    respond_to do |format|
      if @authenticate.update(authenticate_params)
        format.html { redirect_to @authenticate, notice: 'Authenticate was successfully updated.' }
        format.json { render :show, status: :ok, location: @authenticate }
      else
        format.html { render :edit }
        format.json { render json: @authenticate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authenticates/1
  # DELETE /authenticates/1.json
  def destroy
    @authenticate.destroy
    respond_to do |format|
      format.html { redirect_to authenticates_url, notice: 'Authenticate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authenticate
      @authenticate = Authenticate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authenticate_params
      params.require(:authenticate).permit(:email, :password)
    end
end
