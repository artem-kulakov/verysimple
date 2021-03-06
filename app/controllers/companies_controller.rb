class CompaniesController < ApplicationController
  before_action :verify_admin, only: [:destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :check_authority, only: [:edit]

  # GET /companies
  # GET /companies.json
  def index
    @industry_id = params[:industry] || 1
    @industries = Industry.order(:name)

    @companies = Company.where(industry_id: @industry_id).order(:name)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    @disabled = false
  end

  # GET /companies/1/edit
  def edit
    @path = 'companies_path'
    @disabled = true
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @company.save
        if params[:new_record]
          format.html { redirect_to new_record_path(company: @company.id, period: params[:period], gaap: params[:gaap]), notice: 'Company was successfully created.' }
        else
          format.html { redirect_to companies_path, notice: 'Company was successfully created.' }
        end
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :user_id, :industry_id)
    end

    # Check authority for editing somebody's company
    def check_authority
      if current_user.reputation < @company.user.reputation
        flash[:alert] = "You need reputation higher than #{@company.user.reputation} to edit this company"
        redirect_to companies_path
      end
    end
end
