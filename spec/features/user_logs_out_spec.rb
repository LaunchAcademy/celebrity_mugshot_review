require 'spec_helper'

feature 'user logs out', %q{
  As a registered user
  I can logout of the system
  So that I am not logged in anymore
} do
  # *If I am logged in, from any page i see a logout button
  # *When I click logout I am no longer logged in
  # *I am redirected back to the home page

  scenario "logged in, user see a 'Log Out' button that logs me out" do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in "Email", with: "gene1@kiss.com"
    fill_in "Password", with: "password"

    click_on "Sign in"
    click_on "Log Out"

    expect(page).to have_content("Signed out successfully.")
  end
end
