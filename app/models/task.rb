# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
  belongs_to :project
end
