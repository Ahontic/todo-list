# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :database_authenticatable
  devise :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :tasks, through: :projects
  has_secure_password
end
