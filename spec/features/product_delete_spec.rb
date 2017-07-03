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
    visit product_path(product)
    click_on "Delete Product"
    expect(page).not_to have_content "Fake Test Name"
  end

end