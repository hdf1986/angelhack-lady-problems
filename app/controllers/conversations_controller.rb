class ConversationsController < ApplicationController
  helper_method :conversation
  def show
    @conversation = Conversation.find(params[:id])
  end

  private
  def conversation
    @conversation
  end
end
