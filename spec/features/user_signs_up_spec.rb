require 'spec_helper'

feature 'User signs up', %q{
  As a visiting user
  I want to be able to sign up for the site
  So that I can comment on pictures

  Acceptance Criteria

  *I see a signup link on the homepage
  *The signup link take me to a page with a form
  *The form prompts me to enter a first name, last name, username, and password
  *After signing up, I am directed back to the homepage
} do

  scenario "User signs up with valid information" do
    visit new_user_registration_path

    fill_in "First name", with: "Gene"
    fill_in "Last name", with: "Simons"
    fill_in "Username", with: "GeneSimons"
    fill_in "Email", with: "GeneSimons@kiss.com"
    fill_in "Password", with: "Password"

    click_on "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")

  end

  scenario "User enters invalid info" do
    visit new_user_registration_path

    fill_in "First name", with: "Gene"
    fill_in "Last name", with: "Simons"
    fill_in "Username", with: "GeneSimons"
    fill_in "Email", with: ""
    fill_in "Password", with: "Password"

    click_on "Sign up"

    expect(page).to have_content("can't be blank")

  end

  scenario "After signing up, user is directed back to the homepage" do
    visit new_user_registration_path

    fill_in "First name", with: "Gene"
    fill_in "Last name", with: "Simons"
    fill_in "Username", with: "GeneSimons"
    fill_in "Email", with: "gene@gmai.com"
    fill_in "Password", with: "Password"

    click_on "Sign up"

    expect(page).to have_content("Gene Simons")
    expect(page).to have_content("Welcome! You have signed up successfully.")

  end

end

