require 'spec_helper'

feature 'User edit their profile', %q{
  As a registered user
  I can edit my profile
  So that my information is up to date

  Acceptance Criteria

  *From the user page I can click a link to edit my user profile
  *User can click an update button
  *User can fill out form to update fields
} do

  before(:each) do
    visit new_user_registration_path

    fill_in "First name", with: "Gene"
    fill_in "Last name", with: "Simons"
    fill_in "Username", with: "GeneSimons"
    fill_in "Email", with: "GeneSimons@kiss.com"
    fill_in "Password", with: "Password"

    click_on "Sign up"
  end

  scenario 'From the user page I can click a link to edit my user profile' do
    visit edit_user_registration_path

    expect(page).to have_content("Edit User")
  end

  scenario "User can click an update button" do
    visit edit_user_registration_path

    page.should have_selector("input[type=submit][value='Update']")
  end

  scenario "User can fill out form to update fields" do
    visit edit_user_registration_path

    fill_in "First name", with: "Gene1"
    fill_in "Last name", with: "Simons1"
    fill_in "Username", with: "Gene1Simons1"
    fill_in "Email", with: "GeneSimons@kiss.com"
    fill_in "Current password", with: "Password"

    click_on "Update"

    expect(page).to have_content("Gene1 Simons1")
  end
end
