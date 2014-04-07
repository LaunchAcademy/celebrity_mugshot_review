FactoryGirl.define do
  factory :user do
    first_name "Gene"
    last_name "Simons"
    sequence(:email) { |n| "gene#{n}@kiss.com" }
    password "password"
   sequence(:username) { |n| "gene#{n}" }
  end
end
