require 'spec_helper'

feature 'create a new mugshot', %Q{
  As a user
  I want to be able to edit an existing mugshot
  So that other users can see most current information
} do

  # Acceptance Criteria

  # I can navigate to a specific mugshot page
  # I can click a link to edit the mugshot profile
  # I can fill in new information pertaining to that mugshot
  # I can save the new mugshot information

  scenario 'edit an existing mugshot' do
    visit '/mugshots/new'
    fill_in 'First Name', with: 'Justin'
    fill_in 'Last Name', with: 'Bieber'
    fill_in 'Description', with: 'This guy should not be drunk driving'
    select "2014" && "April" && '11', from: "Approximate Date"
    click_button 'Create Mugshot'

    expect(page).to have_content('New Mugshot Submitted!')
    click_link 'Edit Mugshot'
    fill_in 'Last Name', with: 'Davidson'

    click_button 'Submit new information'

    expect(page).to have_content('Davidson')
    expect(page).to have_content('Mugshot Updated.')
  end
end
