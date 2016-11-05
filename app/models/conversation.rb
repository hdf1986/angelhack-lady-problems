class Conversation < ApplicationRecord
  has_many :messages
  def marie_messages
    messages.where(type: 'marie')
  end

  def lady_messages
    messages.where(type: 'lady')
  end
end
