require 'spec_helper'

feature 'User signs up', %q{
  As a visiting user
  I want to be able to sign up for the site
  So that I can comment on pictures

  Acceptance Criteria

  I see a signup link on the homepage
  The signup link take me to a page with a form
  The form prompts me to enter a first name, last name, username, and password
  After signing up, I am directed back to the homepage
} do

  scenario "User signs up with valid information" do
     visit new_user_registration_path

     save_and_open_page
     fill_in "First Name", with: "Gene"


  end

  scenario "User enters NON-valid info"

  scenario "After signing up, I am directed back to the homepage"




end

