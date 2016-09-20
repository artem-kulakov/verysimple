class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_active_nav_item, :set_button_color

  # Never render layout for Ajax requests
  layout proc { false if request.xhr? }

  def set_active_nav_item
    instance_variable_set("@#{controller_name}_active", 'active')
  end

  def set_button_color
    @color = case action_name
    when 'new'
      'primary'
    when 'edit'
      'success'
    end
  end

  protected

    # Give access to admin only
    def verify_admin
      unless current_user.nil?
        unless current_user.admin?
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end
end
