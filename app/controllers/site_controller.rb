class SiteController < ApplicationController
  def index
  	@indicators = Indicator.order(:order)
  	@records = Record.all
  	@values = Value.all
  end
end
