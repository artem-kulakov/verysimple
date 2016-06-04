class SiteController < ApplicationController
  def index
  	@indicators = Indicator.all
  	@records = Record.all
  	@values = Value.all
  end
end
