class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
  has_many :candidacies
  has_many :flats
  validates :first_name, :last_name, presence: true
  mount_uploader :avatar, PhotoUploader
  mount_uploader :id_card, PhotoUploader
  mount_uploader :tax_notice, PhotoUploader
  mount_uploader :payslip, PhotoUploader
end
