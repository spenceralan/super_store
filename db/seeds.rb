# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Product.destroy_all

250.times do
  product = Product.create!(
    name: Faker::Book.title,
    price: Faker::Number.decimal(2),
    country: ISO3166::Country.all.sample.alpha2,
  )
  Faker::Number.between(3, 30).times do
    product.reviews.create!(
      username: Faker::RickAndMorty.character,
      content: Faker::Hipster.sentence(10, true, 5),
      rating: Faker::Number.between(1, 5),
    )
  end
end