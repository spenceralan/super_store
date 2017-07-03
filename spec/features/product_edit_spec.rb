require "rails_helper"

describe "the add product process" do

  let(:product) {
    Product.create(
      name: "Fake Test Name",
      country: "US",
      price: 99.99,
    )
  }

  it "routes to the edit product page" do
    product
    visit products_path
    click_on "Fake Test Name"
    click_on "Edit Product"
    expect(page).to have_content "Edit Product"
  end

  it "edits an existing product" do
    visit edit_product_path(product)
    fill_in 'Name', :with => 'Super Duper Test Fake Product'
    fill_in 'Price', :with => '99.99'
    page.select("Afghanistan", from: "product_country")
    click_on 'Update Product'
    expect(page).to have_content "Super Duper Test Fake Product"
  end

  it "returns to the product page if nothing is updated" do
    visit edit_product_path(product)
    click_on 'Update Product'
    expect(page).to have_content 'Fake Test Name'
  end

  it "gives error when name is removed" do
    visit edit_product_path(product)
    fill_in 'Name', :with => ''
    click_on 'Update Product'
    expect(page).to have_content 'Please fix these errors:'
    expect(page).to have_content "Name can't be blank"
  end

end