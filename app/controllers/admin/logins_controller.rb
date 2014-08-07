class Admin::LoginsController < ApplicationController
  layout false
  #SCF TODO
  #layout 'admin'

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_messages_path
    else
      flash.now[:danger] = 'Log In Failed'
      render 'new'
    end
  end

#SCF TODO  We need to mprove this.  We should be using cookies.  
  def destroy
    session[:user_id] = nil
    render 'new'
  end

end