class Api::V1::ConversationsController < ApplicationController
  def last_messages
    conversation = Conversation.find(params[:conversation_id])
    messages = conversation.messages.not_readed.where("created_at >= ?", Time.at((params[:from].to_i/1000).to_i))
    messages.each(&:read!)
    render json: messages
  end
end
