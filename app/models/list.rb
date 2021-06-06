class List < ApplicationRecord
  has_many_attached :photos
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
end
