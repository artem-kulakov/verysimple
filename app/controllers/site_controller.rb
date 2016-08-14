class SiteController < ApplicationController
  def index
    @periods = Period.where("ending < ?", Date.today).order(:ending)
    @period = Period.find(params[:period] || 1)

    @gaaps = Gaap.order(:name)
    @gaap = Gaap.find(params[:gaap] || 1)

  	@indicators = Indicator.order(:order)
  	@records = Record.where(period_id: @period, gaap_id: @gaap)
  	@values = Value.all
  end
end
