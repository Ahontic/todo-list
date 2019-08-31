class Task < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
  belongs_to :project
  acts_as_list scope: :project
end
