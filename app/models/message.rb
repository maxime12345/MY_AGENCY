class Message < ApplicationRecord
  belongs_to :application
  belongs_to :sender, :class_name => 'User', :foreign_key  => "sender_id"
  belongs_to :recipient, :class_name => 'User', :foreign_key  => "recipient_id"
  validates :content, presence: true
end
