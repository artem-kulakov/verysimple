class SiteController < ApplicationController
  def index
    @industries = Industry.order(:name)
    @industry = Industry.find(params[:industry] || 1)

    @periods = Period.where("ending < ?", Date.today).order(:ending)
    @period = Period.find(params[:period] || @periods.last)

    @gaaps = Gaap.order(:name)
    @gaap = Gaap.find(params[:gaap] || 1)

    @currencies = Currency.order(:code)
    @currency = Currency.find(params[:currency] || 150)

  	@indicators = Indicator.order(:order)

  	@records = Record.joins(:company).where(companies: {industry_id: @industry.id}, period_id: @period, gaap_id: @gaap)
  	@values = Value.all
  end
end
