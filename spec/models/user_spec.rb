require 'spec_helper'

describe User do

  it "requires a valid first name" do
    no_first_name = FactoryGirl.build(:user, first_name: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:first_name]).to include "can't be blank"
  end

  it "requires a valid last name"do
    no_last_name = FactoryGirl.build(:user, last_name: nil)

    expect(no_last_name).to_not be_valid
    expect(no_last_name.errors[:last_name]).to include "can't be blank"
  end

  it "requires a valid email"do
    no_email_name = FactoryGirl.build(:user, email: nil)

    expect(no_email_name).to_not be_valid
    expect(no_email_name.errors[:email]).to include "can't be blank"
  end

  it "requires a unique email"do
    email_one_name = FactoryGirl.create(:user, email: "test@gmail.com")
    email_two = FactoryGirl.build(:user, email: "test@gmail.com")

    expect(email_two).to_not be_valid
    expect(email_two.errors[:email]).to include "has already been taken"
  end

  it "requires a valid username"do
    no_username = FactoryGirl.build(:user, username: nil)

    expect(no_username).to_not be_valid
    expect(no_username.errors[:username]).to include "can't be blank"
  end

  it "requires a unique username"do
    username = FactoryGirl.create(:user, username: "tes")
    username_two = FactoryGirl.build(:user, username: "tes")

    expect(username_two).to_not be_valid
    expect(username_two.errors[:username]).to include "has already been taken"
  end

  it "requires a secure password"do
    no_first_name = FactoryGirl.build(:user, password: nil)

    expect(no_first_name).to_not be_valid
    expect(no_first_name.errors[:password]).to include "can't be blank"
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
