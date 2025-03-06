# frozen_string_literal: true

# Movie represents a film in the system.
class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
