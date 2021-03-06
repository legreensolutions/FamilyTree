class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery



  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  #filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

before_filter  :instantiate_controller_and_action_names
include SimpleCaptcha::ControllerHelpers
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

     def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to login_url
        return false
      end
    end
     def store_location
      session[:return_to] = request.fullpath
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end


   def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
    @page_id = "#{@current_controller}_#{@current_action}"
  end



end
