class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_active_nav_item

  def set_active_nav_item
  	instance_variable_set("@#{controller_name}_active", 'active')
  end
end
