class Api::V1::MessagesController < ApplicationController
  def create
    msg = Message.new(permitted_params)
    msg.conversation = Conversation.find(conversation_id)
    msg.type = :lady
    msg.save
    Marie.talk(msg.conversation)
    redirect_to conversation_path(msg.conversation)
  end

  private
  def conversation_id
    params[:conversation_id]
  end
  
  def permitted_params
    params.permit(:content)
  end
end
