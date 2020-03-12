# frozen_string_literal: true

class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attribute :name
  belongs_to :user
  has_many :tasks
end
