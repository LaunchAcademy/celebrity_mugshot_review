require 'spec_helper'

describe Comment do

  it {should belong_to(:mugshot)}
  it {should belong_to(:user)}
end
