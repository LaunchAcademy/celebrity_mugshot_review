require 'spec_helper'

feature "Votes on a mugshot", %q{
  As a user who has an opinion,
  I want to be able to up vote or down vote a mugshot,
  so that people will understand my perspective.
} do
  # -----Acceptance Criteria-----

  # [] User can click a button that votes up or down
  # [] running count of votes up and down

  before(:each) do
    @user = FactoryGirl.build(:user)
    sign_up_as(@user)
  end

  scenario "User can click a button that votes up or down" do


  end
end
