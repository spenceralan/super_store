class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :presence => true
  validates :price, :presence => true
  validates :country, :presence => true

  def country_name
    ISO3166::Country[country].name
  end

  scope :find_by_country, -> (country) { where(country: country) }
  scope :recent_products, -> { order(created_at: :desc).limit(3) }
  scope :most_reviewed, -> {(
    select("products.*, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
end
