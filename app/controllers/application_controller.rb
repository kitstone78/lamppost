class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :admin?
  helper_method :authorize?
  
  # Needed by CanCan
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  protected
  # used in the before_filter to control access to some controllers
  def authorize?
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to 'root' 
      false
    end
  end

  def admin?
      if (params[:id]) == !nil
        @user = User.find(params[:id])
        @user.role == 'Admin'
      end
  end


  # for authorization, used by CanCanCan
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
