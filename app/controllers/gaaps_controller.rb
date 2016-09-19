class GaapsController < ApplicationController
  before_action :set_gaap, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /gaaps
  # GET /gaaps.json
  def index
    @gaaps = Gaap.all
  end

  # GET /gaaps/1
  # GET /gaaps/1.json
  def show
  end

  # GET /gaaps/new
  def new
    @gaap = Gaap.new
  end

  # GET /gaaps/1/edit
  def edit
  end

  # POST /gaaps
  # POST /gaaps.json
  def create
    @gaap = Gaap.new(gaap_params)

    respond_to do |format|
      if @gaap.save
        format.html { redirect_to @gaap, notice: 'Gaap was successfully created.' }
        format.json { render :show, status: :created, location: @gaap }
      else
        format.html { render :new }
        format.json { render json: @gaap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gaaps/1
  # PATCH/PUT /gaaps/1.json
  def update
    respond_to do |format|
      if @gaap.update(gaap_params)
        format.html { redirect_to @gaap, notice: 'Gaap was successfully updated.' }
        format.json { render :show, status: :ok, location: @gaap }
      else
        format.html { render :edit }
        format.json { render json: @gaap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gaaps/1
  # DELETE /gaaps/1.json
  def destroy
    @gaap.destroy
    respond_to do |format|
      format.html { redirect_to gaaps_url, notice: 'Gaap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gaap
      @gaap = Gaap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gaap_params
      params.require(:gaap).permit(:name)
    end
end
