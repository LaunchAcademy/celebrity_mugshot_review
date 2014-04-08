require 'spec_helper'

describe Comment do

  it {should belong_to(:mugshot)}
  it {should belong_to(:user)}

  it { should have_valid(:title).when('stuff st') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:description).when('Boston', "New York City") }
  it { should_not have_valid(:description).when('', nil) }
end
