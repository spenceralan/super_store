class Product < ApplicationRecord
  has_many :reviews

  validates :name, :presence => true
  validates :price, :presence => true
  validates :country, :presence => true

  scope :recent_products, -> { order(created_at: :desc).limit(3) }
  scope :most_reviewed, -> {(
    select("products.*, count(review.id) as reviews_count")
    .joins(:comments)
    .group("products.id")
    .order("comments_count DESC")
    .limit(1)
  )}
end
