class Product < ApplicationRecord
  has_many :reviews

  validates :name, :presence => true
  validates :price, :presence => true
  validates :country, :presence => true

  scope :most_reviewed, -> {(
    select("products.*, count(review.id) as reviews_count")
    .joins(:comments)
    .group("products.id")
    .order("comments_count DESC")
    .limit(1)
  )}
end
