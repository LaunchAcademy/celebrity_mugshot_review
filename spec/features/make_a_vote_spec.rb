require 'spec_helper'

feature 'create a comment', %Q{
  As a user who has an opinion,
  I want to be able to up vote or down vote a mugshot,
  so that people will understand my perspective.
} do

# Acceptance Criteria

# User can click a button that votes up or down
# Running count of votes up and down

  scenario 'create a new valid mugshot post' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    mugshot = FactoryGirl.create(:mugshot, user: user)
    visit mugshot_path(mugshot)

    prev_count = 0
    click_button "Guilty"
    expect(Mugshot.first.vote_count).to eql(prev_count + 1)
  end
end
