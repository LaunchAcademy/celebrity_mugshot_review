require 'spec_helper'

describe User do

  it "requires a valid first name" do
    no_first_name = FactoryGirl.build(:user, first_name: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:first_name]).to_not be_blank
  end

  it "requires a valid last name"do
    no_last_name = FactoryGirl.build(:user, last_name: nil)

    expect(no_last_name).to_not be_valid
    expect(no_last_name.errors[:last_name]).to_not be_blank
  end

  it "requires a valid email"do
    no_email_name = FactoryGirl.build(:user, email: nil)

    expect(no_email_name).to_not be_valid
    expect(no_email_name.errors[:email]).to_not be_blank
  end

  it "requires a valid user name"do
    no_user_name = FactoryGirl.build(:user, user_name: nil)

    expect(no_user_name).to_not be_valid
    expect(no_user_name.errors[:user_name]).to_not be_blank
  end

  it "requires a secure password"do
    no_first_name = FactoryGirl.build(:user, password: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:password]).to_not be_blank
  end

  it "creates a new user when passed valid paramters" do
    valid_user = FactoryGirl.create(:user)
    expect(valid_user).to be_valid
    expect(valid_user.errors).to be_blank
  end

  it "has a method to return a full name" do
    valid_user = FactoryGirl.create(:user)
    expect(valid_user.full_name).to eq("Gene Simons")
  end

end
