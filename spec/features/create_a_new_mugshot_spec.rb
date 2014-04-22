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
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit new_mugshot_path

    celeb = FactoryGirl.build(:mugshot)

    fill_in 'First Name', with: celeb.first_name
    fill_in 'Last Name', with: celeb.last_name
    fill_in 'Description', with: celeb.description
    select "2014" && "April" && '11', from: "Approximate Date"
    attach_file 'mugshot_image', File.join(Rails.root, '/spec/support/cat-mug-shot.jpg')

    click_button 'Submit'

    expect(page).to have_content('New Mugshot Submitted!')
    expect(page).to have_content(celeb.first_name)
    expect(page).to have_content(celeb.last_name)
    expect(page).to have_content(celeb.description)
  end
end
