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
    it 'has a first name'
    it 'has a last name'
    it 'has a valid photo'

  end
end
