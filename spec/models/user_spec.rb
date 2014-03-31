require 'spec_helper'

describe User do

  it "requires a valid first name" do
    no_first_name = FactoryGirl.build(:user, first_name: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:first_name]).to_not be_blank
  end

  it "requires a valid last name"do
    no_first_name = FactoryGirl.build(:user, last_name: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:last_name]).to_not be_blank
  end

  it "requires a valid email"do
    no_first_name = FactoryGirl.build(:user, email: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:email]).to_not be_blank
  end

  it "requires a valid user name"do
    no_first_name = FactoryGirl.build(:user, first_name: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:user_name]).to_not be_blank
  end

  it "requires a secure password"do
    no_first_name = FactoryGirl.build(:user, password: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:password]).to_not be_blank
  end

  it "creates a new user when passed valid paramters"
  it "has a method to return a full name"

end
