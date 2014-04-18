require 'spec_helper'

describe Vote do

  it {should belong_to(:mugshot)}
  it {should belong_to(:user)}

  context 'invalid vote' do
    let (:vote) {Vote.new}

    it 'does not have a user id' do
      expect(vote).to_not be_valid
      expect(vote.errors[:user_id]).to include "can't be blank"
    end

    it 'does not have a mugshot id' do
      expect(vote).to_not be_valid
      expect(vote.errors[:mugshot_id]).to include "can't be blank"
    end
  end
end
