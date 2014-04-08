require 'spec_helper'

feature 'create a comment', %Q{
  As a logged in user
  I can leave a text comment on a mugshot
  To let the world know what I really think...
} do

# Acceptance Criteria

# I see a list of mugshots on the homepage
# I can click the mugshot picture
# I am redirected to the specific mugshot page with picture
# I am able to leave a comment under the picture

  scenario 'create a new valid mugshot post' do
    user = SignUpAs(:user)
    mugshot = FactoryGirl.create(:mugshot)
    visit mugshot_path(mugshot)

    fill_in 'Title', with: 'Hahaha this mugshot...'
    fill_in('Comments', with: "Oh my god I can't believe this mugshot!")
    click_on('Submit')

    expect(page).to have_content('Comment Submitted.')
    expect(page).to have_content("Oh my god I can't believe this mugshot!")
    expect(page).to have_content(user.username)

  end
end
