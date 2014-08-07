class Admin::MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = message.new(params.require(:message).permit!)
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
  if @message.update(params.require(:message).permit!)
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

end