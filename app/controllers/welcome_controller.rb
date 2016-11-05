class WelcomeController < ApplicationController
  def index
    conversation = Conversation.create
    redirect_to conversation_path(conversation)
  end
end
