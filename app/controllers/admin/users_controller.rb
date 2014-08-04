class Admin::UsersController < ApplicationController
  def index
    @users = User.order('username')
  end

  def create
    @user = User.new(params.require(:user).permit!)
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
  if @user.update(params.require(:user).permit!)
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

end