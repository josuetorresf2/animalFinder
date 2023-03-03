require "rails_helper"

# Homepage / rootpage should show animal finder
RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see animal finder" do
    visit root_path
    expect(page).to have_text("Animal Finder")
  end
end