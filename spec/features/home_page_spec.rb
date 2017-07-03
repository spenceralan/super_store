require "rails_helper"

describe "root path" do
  it "correctly routes to root path" do
    visit root_path
    expect(page).to have_content "Most Recently Added Products:"
    expect(page).to have_content "Most Reviewed Product:"
  end
end