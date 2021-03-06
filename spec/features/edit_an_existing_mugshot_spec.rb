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
    celeb = FactoryGirl.create(:mugshot, user: user)
    visit edit_mugshot_path(celeb)
    fill_in 'Last Name', with: celeb.last_name
    attach_file 'mugshot_image', File.join(Rails.root, '/spec/support/cat-mug-shot.jpg')
    click_on 'Update Mugshot'
    expect(page).to have_content(celeb.last_name)
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
    expect(page).to have_content("Sorry, you cannot edit a post that you didn\'t create.")
  end
end
