class Message < ApplicationRecord
  belongs_to :conversation
  validates :content, presence:true, blank: false
  self.inheritance_column = :type_column
end
