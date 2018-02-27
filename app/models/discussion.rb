class Discussion < ApplicationRecord
  belongs_to :application
  has_many :messages
end
