class RecordsController < ApplicationController
  before_action :verify_admin, only: [:index, :destroy]
  before_action :authenticate_user!
  before_action :set_record, only: [:show, :edit, :update, :destroy]

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
  end

  # GET /records/1
  # GET /records/1.json
  def show
  end

  # GET /records/new
  def new
    @record = Record.new
    @record.values.new
    @indicators = Indicator.order(:order)

    @periods = Period.order(:ending)
    @period_id = params[:period]
    
    @gaaps = Gaap.order(:name)
    @gaap_id = params[:gaap]

    @companies = Company.without_records(@period_id, @gaap_id)
    @company_id = params[:company]
  end

  def fetch_companies
    @companies = Company.without_records(params[:period], params[:gaap])
    respond_to do |format|
      format.js
    end
  end

  # GET /records/1/edit
  def edit
    @indicators = Indicator.order(:order)

    @periods = Period.order(:ending)
    @period_id = params[:period]
    
    @gaaps = Gaap.order(:name)
    @gaap_id = params[:gaap]

    @companies = Company.all
    @company = @record.company_id

    # Build values for new indicators
    @indicators.each do |indicator|
      if @record.values.where(indicator_id: indicator.id).empty?
        @record.values.new(indicator_id: indicator.id)
      end
    end
  end

  # POST /records
  # POST /records.json
  def create
    # Change user's reputation
    empty_values = record_params[:values_attributes].count { |index, params| params[:amount].empty? }
    completeness = 1 - empty_values.to_f / record_params[:values_attributes].count
    current_reputation = current_user.reputation
    reward = (1000 - current_reputation) * 0.1 * completeness
    if current_reputation < 1000
      new_reputation =  current_reputation + reward
      if new_reputation.to_i == current_reputation.to_i
        new_reputation += 1
      end
      current_user.update(reputation: new_reputation)
    end

    @record = Record.new(record_params.merge(:user_id => current_user.id, :reward => reward))

    respond_to do |format|
      if @record.save
        format.html { redirect_to root_path(period: record_params[:period_id], gaap: record_params[:gaap_id]), notice: 'Record was successfully created.' }
        format.json { render :show, status: :created, location: @record }
      else
        format.html { render :new }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to root_path, notice: 'Record was successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to root_path(period: params[:period], gaap: params[:gaap]), notice: 'Record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:company_id, :period_id, :gaap_id, values_attributes: [:id, :indicator_id, :amount, :unit_id])
    end
end
