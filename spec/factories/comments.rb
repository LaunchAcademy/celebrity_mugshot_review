# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    title "MyString"
    description "MyText"
    mugshot
    user
  end

end
