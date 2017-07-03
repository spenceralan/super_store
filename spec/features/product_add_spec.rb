require "rails_helper"

describe "the add product process" do

  it "routes to the new product page" do
    visit root_path
    click_on "Add Product"
    expect(page).to have_content "New Product"
  end

  it "adds a new product" do
    visit new_product_path
    fill_in 'Name', :with => 'Test Fake Product'
    fill_in 'Price', :with => '99.99'
    fill_in 'Country', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Your link has been SAVED'
  end

  # it "gives error when no name is entered" do
  #   visit new_link_path
  #   click_on 'Create Link'
  #   expect(page).to have_content 'Please fix these errors:'
  # end

  # it "gives error when no country is entered" do
  #   visit new_link_path
  #   click_on 'Create Link'
  #   expect(page).to have_content 'Please fix these errors:'
  # end

  # it "gives error when no price is entered" do
  #   visit new_link_path
  #   click_on 'Create Link'
  #   expect(page).to have_content 'Please fix these errors:'
  # end
end