class SiteController < ApplicationController
  def index
  	@indicators = Indicator.all
  	@reports = Report.all
  	@values = Value.all
  end
end
