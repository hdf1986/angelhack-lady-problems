class WelcomeController < ApplicationController
  def index
    conversation = Conversation.create
    Marie.welcome(conversation)
    redirect_to conversation_path(conversation)
  end
end
