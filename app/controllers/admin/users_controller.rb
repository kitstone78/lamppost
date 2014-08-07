class Admin::UsersController < ApplicationController
  before_action :require_login

  def index
    @users = User.order('username')
  end

  def create
    @user = User.new(message_params)
  if @user.save
    redirect_to admin_user_path(@user), notice: "User #{@user.id} was created"
  else
    render 'new'
    end
  end

  def show
   @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  if @user.update(message_params)
    redirect_to admin_users_path(@user), notice: "User #{@user.username} was updated successfully"
  else
    render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "User #{@user.id} was deleted}"
  end

  def require_login
    unless logged_in?
      redirect_to admin_login_path, danger: 'Please log in to continue'
    end
  end

  def logged_in?
    session[:user_id].present?
  end

  private
  def message_params
    params.require(:message).permit(:text, :user_id)
  end

end