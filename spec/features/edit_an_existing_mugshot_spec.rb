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
    mugshot = FactoryGirl.create(:mugshot)
    visit edit_mugshot_path(mugshot)

    fill_in 'Last Name', with: 'Davidson'

    click_button 'Update Mugshot'
    expect(page).to have_content('Davidson')
    expect(page).to have_content('Mugshot Updated')
  end
end
