class Admin::MessagesController < ApplicationController
  before_action :require_login
  def index
    @messages = Message.all
  end

  def create
    @message = message.new(message_params)
  if @message.save
    redirect_to admin_message_path(@message), notice: "message #{@message.id} was created"
  else
    render 'new'
    end
  end

  def show
   @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
  end 

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
  if @message.update(message_params)
    redirect_to admin_messages_path(@message), notice: "message #{@message.messagename} was updated successfully"
  else
    render 'edit'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to admin_messages_path, notice: "message #{@message.id} was deleted}"
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