require "rails_helper"

describe "the add product process" do

  let(:product) {
    Product.create(
      name: "Fake Test Name",
      country: "US",
      price: 99.99,
    )
  }

  it "deletes a review from product page" do
    product.reviews.create(
      username: "Fake User",
      content: "This is a really long fake review becase the review validation needs to be between 50 and 250 characters.",
      rating: 5,
    )
    visit product_path(product)
    click_on "Delete Review"
    expect(page).not_to have_content "This is a really long fake review becase the review validation needs to be between 50 and 250 characters."
  end

end