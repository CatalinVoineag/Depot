class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	include Pundit 
  include SessionsHelper
  include CartLinesHelper
  include SessionsHelper

  before_filter :require_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def require_user
  	unless current_user
  		flash[:error] = "You must be logged in to access this page"
  		redirect_to login_path
  		return false
  	end
  end

  def require_admin_user
  	unless current_user && current_user.admin?
  		flash[:error] = "You must be an admin user to perform this action"
  		redirect_to root_path
  		return false
  	end
  end

  # Cheks the policies and decides if the user has access to the action
  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = I18n.t "pundit.#{policy_name}.#{exception.query}", default: 'You are not allowed to perform this action.'

    logger.info "\n\nFailed pundit permission check. policy_name: #{policy_name}, query: #{exception.query}\n\n"
    session[:return_to] = request.referer
    redirect_back_or(root_path)
  end


end
