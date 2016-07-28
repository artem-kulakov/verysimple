class SiteController < ApplicationController
  def index
    @periods = Period.order(:ending)
    @period = Period.find(params[:period] || 1)

  	@indicators = Indicator.order(:order)
  	@records = Record.where(period_id: @period)
  	@values = Value.all
  end
end
