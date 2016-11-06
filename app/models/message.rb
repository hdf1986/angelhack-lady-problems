class Message < ApplicationRecord
  belongs_to :conversation
  validates :content, presence:true, blank: false
  self.inheritance_column = :type_column
  scope :not_readed, -> { where(readed: false)}
  scope :present, -> { where("created_at <= ?", Time.now)}

  def read!
    self.readed = true
    self.save
  end
end
