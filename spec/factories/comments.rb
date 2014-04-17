FactoryGirl.define do
  factory :comment do
    title "MyString"
    description "MyText"
    mugshot
    user
  end
end
