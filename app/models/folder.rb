class Folder < ApplicationRecord
  belongs_to :user
  has_many :doc_files
  validates :user, presence: true
end
