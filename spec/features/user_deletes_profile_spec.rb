require 'spec_helper'

feature 'User edit their profile', %q{
  As a registered user
  I can delete my profile from the system
  So that I am not a member of the site

  Acceptance Criteria

  * From the profile page I can click a link that will delete my profile
  * Before the system deletes my profile I am asked to
    confirm my deletion
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

  scenario "From the profile page I can click a link that will delete my profile" do
    visit edit_user_registration_path

    expect(page).to have_content("Cancel my account")
  end

  scenario "Before the system deletes my profile I am asked to confirm my deletion" do
    visit edit_user_registration_path

    prev_count = User.count

    click_on "Cancel my account"

    expect(User.count).to eql(prev_count - 1)

  end

end
