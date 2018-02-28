class Message < ApplicationRecord
  belongs_to :candidacy
  belongs_to :sender, :class_name => 'User', :foreign_key  => "sender_id"
  belongs_to :recipient, :class_name => 'User', :foreign_key  => "recipient_id"
  validates :content, presence: true
end
