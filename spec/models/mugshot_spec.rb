require 'spec_helper'

describe Mugshot do
  context 'validations' do
    let (:mugshot) {Mugshot.new}

    it 'requres a first name' do
      expect(mugshot).to_not be_valid
      expect(mugshot.errors[:first_name]).to be_present
    end

    it 'requires a last name ' do
      expect(mugshot).to_not be_valid
      expect(mugshot.errors[:last_name]).to be_present
    end

    it 'validates added photo'
    it 'validates imaging format'
    it 'validates url formatting'

  end
end
