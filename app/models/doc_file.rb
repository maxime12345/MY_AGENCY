class DocFile < ApplicationRecord
  belongs_to :folder
  belongs_to :doc_category
  validates :name, presence: true
end
