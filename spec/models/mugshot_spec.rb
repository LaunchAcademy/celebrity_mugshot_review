require 'spec_helper'

describe Mugshot do
  context 'invalid mugshot creation' do
    let (:mugshot) {Mugshot.new}

    it 'does not have a first name' do
      expect(mugshot).to_not be_valid
      expect(mugshot.errors[:first_name]).to include "can't be blank"
    end

    it 'does not have a last name' do
      expect(mugshot).to_not be_valid
      expect(mugshot.errors[:last_name]).to be_present
    end

    it 'does not have a valid photo' do
      expect(mugshot).to_not be_valid
      expect(mugshot.errors[:image]).to be_present
    end

    it {should have_many(:comments)}
    it {should belong_to(:user)}
  end

  context 'valid mugshot creation' do

    it { should have_valid(:first_name).when('Eric', 'Doppleganner Eric') }
    it { should_not have_valid(:first_name).when('', nil) }

    it { should have_valid(:last_name).when('kelly', 'Doppleganner kelly') }
    it { should_not have_valid(:last_name).when('', nil) }

    it { should have_valid(:last_name).when('photo.txt') }
    it { should_not have_valid(:last_name).when('', nil) }

  end

  context 'testing methods' do

    it 'has a full name method' do
      user = FactoryGirl.create(:user)

      expect(user.full_name).to eq("Gene Simons")
    end

    it 'has a method that returns true if a user has voted on the mugshot' do

      vote = FactoryGirl.create(:vote)
      mugshot = Mugshot.first
      user = User.first

      expect(mugshot.has_vote_from?(user)).to eq(true)
    end

    it 'has a method that returns false if a user has NOT voted on the mugshot' do
      user = FactoryGirl.create(:user)
      vote = FactoryGirl.create(:vote)
      mugshot = Mugshot.first

      expect(mugshot.has_vote_from?(user)).to eq(false)
    end

    it 'has to return the vote id that the person voted on' do
      vote = FactoryGirl.create(:vote)
      mugshot = Mugshot.first
      user = User.first

      expect(mugshot.vote_from(user)).to eq(vote)
    end

  end
end
