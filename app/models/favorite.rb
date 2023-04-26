class Favorite < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: true
  validates :url, :urlToImage, :description, :content, presence: true
end
