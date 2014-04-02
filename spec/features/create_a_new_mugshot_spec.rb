require 'spec_helper'

feature 'create a new mugshot', %Q{
  As a user
  I want to be able to upload a new celebrity mugshot
  So that other users can comment and vote on the mugshot
} do

# Acceptance Criteria

# Upload a picture of a celebrity mugshot
# Type in a celebrity name to associate with the mugshot
# Type in a description to go with the mugshot
# Add a date referencing the approximate date the mugshot was taken
# Post celebrity mugshot so all users can see it


  scenario 'create a new valid mugshot post' do
    visit '/mugshots/new'
    fill_in 'First Name', with: 'Justin'
    fill_in 'Last Name', with: 'Bieber'
    fill_in 'Description', with: 'This guy should not be drunk driving'
    fill_in 'Approximate Date', with: '10/3/13'
    #fill_in picture here (insert link or upload picture)
    click_button 'Upload Mugshot'
    expect(page).to have_content('Upload Sucessful!')
  end
end
