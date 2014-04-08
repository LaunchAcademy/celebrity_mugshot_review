
require 'spec_helper'

feature 'delete an existing mugshot', %Q{
  As a user
  I want to be able to delete a celebrity mugshot
  So that it no longer exists.
} do

# Acceptance Criteria

# An authorized user can navigate to an existing mugshot.
# As an authorized user I can delete a mugshot.

  scenario 'delete an existing valid mugshot post' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_mugshot_path

    celeb = FactoryGirl.create(:mugshot, user: user)
    celeb.save

    # fill_in 'First Name', with: celeb.first_name
    # fill_in 'Last Name', with: celeb.last_name
    # fill_in 'Description', with: celeb.description
    # select "2014" && "April" && '11', from: "Approximate Date"
    # click_button 'Create Mugshot'

    # expect(page).to have_content('New Mugshot Submitted!')
    # expect(page).to have_content('Bieber')
    visit mugshot_path(celeb)

    click_on 'Delete'
    expect(page).to have_content('Mugshot deleted.')
  end
end
