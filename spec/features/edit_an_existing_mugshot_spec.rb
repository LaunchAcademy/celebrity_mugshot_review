require 'spec_helper'

feature 'create a new mugshot', %Q{
  As a user
  I want to be able to edit an existing mugshot
  So that other users can see most current information
} do
  # Acceptance Criteria

  # An invalid user can not edit a mughshot that doesnot belong to them
  # I can navigate to a specific mugshot page
  # I can click a link to edit the mugshot profile
  # I can fill in new information pertaining to that mugshot
  # I can save the new mugshot information

  scenario 'edit an existing mugshot' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_mugshot_path

    celeb = FactoryGirl.create(:mugshot, user: user)

<<<<<<< HEAD
    fill_in 'Last Name', with: 'Davidson'
    click_button 'Choose File'
=======
    visit edit_mugshot_path(celeb)
>>>>>>> 6a7d84d992df6507345cd7dd1a7bd5394baa2365

    fill_in 'Last Name', with: "Davidson"

    click_button 'Update'
    expect(page).to have_content('Davidson')
    expect(page).to have_content('Mugshot Updated')
  end

  scenario "A user who did not create the mugshot can not edit the mughshot that doesnot belong to them" do
    not_the_maker = FactoryGirl.create(:user)

    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_mugshot_path

    mugshot = FactoryGirl.create(:mugshot, user: user)

    click_on "Log Out"
    sign_in_as(not_the_maker)

    visit edit_mugshot_path(mugshot)

    expect(page).to have_content("Sorry you can not edit post you did not create")
  end
end
