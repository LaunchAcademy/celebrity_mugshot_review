require 'spec_helper'

feature 'create a comment', %Q{
  As a logged in user
  I can leave a text comment on a mugshot
  To let the world know what I really think...
} do

# Acceptance Criteria

# I am redirected to the specific mugshot page with picture
# I am able to leave a comment under the picture
  scenario 'create a new valid mugshot post' do
    user1 = FactoryGirl.create(:user)
    sign_in_as(user1)
    mugshot = FactoryGirl.create(:mugshot, user: user1)
    visit mugshot_path(mugshot)

    fill_in 'Title', with: 'Hahaha this mugshot...'
    fill_in('Comment', with: "Oh my god I can't believe this mugshot!")
    click_on('Oh Damn... Submit')

    expect(page).to have_content("New comment Submitted!")
    expect(page).to have_content("Oh my god I can't believe this mugshot!")
  end

  scenario 'prompted for valid input when info is invalid' do
    user1 = FactoryGirl.create(:user)
    sign_in_as(user1)
    mugshot = FactoryGirl.create(:mugshot, user: user1)
    visit mugshot_path(mugshot)

    fill_in 'Title', with: ''
    fill_in('Comment', with: "Oh my god I can't believe this mugshot!")
    click_on('Oh Damn... Submit')

    expect(page).to have_content("Opps.. forgot the title")
  end
end
