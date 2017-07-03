require "rails_helper"

describe "the add product process" do

  let(:product) {
    Product.create(
      name: "Fake Test Name",
      country: "US",
      price: 99.99,
    )
  }

  it "routes to the add review page" do
    visit product_path(product)
    click_on "Add Review"
    expect(page).to have_content "New Review for Fake Test Name"
  end

  it "adds a new review" do
    visit new_product_review_path(product)
    fill_in 'Username', :with => 'Test Fake Review'
    fill_in 'Content', :with => 'This is a really long fake review becase the review validation needs to be between 50 and 250 characters.'
    fill_in 'Rating', :with => '5'
    click_on 'Create Review'
    expect(page).to have_content "Test Fake Review"
  end

  it "gives error when no name is entered" do
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'Please fix these errors:'
    expect(page).to have_content "Username can't be blank"
  end

  it "gives error when no content is entered" do
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'Please fix these errors:'
    expect(page).to have_content "Content can't be blank"
  end

  it "gives error when no rating is entered" do
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'Please fix these errors:'
    expect(page).to have_content "Rating can't be blank"
  end

end