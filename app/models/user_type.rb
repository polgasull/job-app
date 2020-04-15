# frozen_string_literal: true

class UserType < ApplicationRecord
  has_many :users

  validates :name, presence: true
end