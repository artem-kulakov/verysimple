class IndicatorsController < ApplicationController
  before_action :verify_admin
  before_action :authenticate_user!, except: [:index]
  before_action :set_indicator, only: [:show, :edit, :update, :destroy]

  # GET /indicators
  # GET /indicators.json
  def index
    @industry_id = params[:industry] || 1
    @indicators = Indicator.where(industry_id: [0, @industry_id]).order(:order)
  end

  # GET /indicators/1
  # GET /indicators/1.json
  def show
  end

  # GET /indicators/new
  def new
    @indicator = Indicator.new(order: Indicator.count)
    
    @industries = Industry.all
    @industry_id = params[:industry] || 1
  end

  # GET /indicators/1/edit
  def edit
    @types = Type.all
    @type_id = @indicator.type_id
  end

  # GET /indicators/reorder
  def reorder
    @indicators = Indicator.order(:order)
  end

  # POST /indicators
  # POST /indicators.json
  def create
    @indicator = Indicator.new(indicator_params)

    respond_to do |format|
      if @indicator.save
        format.html { redirect_to indicators_path, notice: 'Indicator was successfully created.' }
        format.json { render :show, status: :created, location: @indicator }
      else
        format.html { render :new }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicators/1
  # PATCH/PUT /indicators/1.json
  def update
    respond_to do |format|
      if @indicator.update(indicator_params)
        format.html { redirect_to indicators_path, notice: 'Indicator was successfully updated.' }
        format.json { render :show, status: :ok, location: @indicator }
      else
        format.html { render :edit }
        format.json { render json: @indicator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /indicators/update_order
  def update_order
    respond_to do |format|
      if Indicator.update(params['indicator'].keys, params['indicator'].values)
        format.html { redirect_to indicators_path }
      else
        format.html { render :index }
      end
    end
  end

  # DELETE /indicators/1
  # DELETE /indicators/1.json
  def destroy
    @indicator.destroy
    respond_to do |format|
      format.html { redirect_to indicators_url, notice: 'Indicator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicator
      @indicator = Indicator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicator_params
      params.require(:indicator).permit(:name, :order, :type_id)
    end
end
