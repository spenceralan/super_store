class Product < ApplicationRecord
  has_many :reviews

  validates :name, :presence => true
  validates :price, :presence => true
  validates :country, :presence => true

  scope :recent_products, -> { order(created_at: :desc).limit(3) }
  scope :most_reviewed, -> {(
    select("products.*, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
end
