 FactoryGirl.define do
  factory :mugshot do
    first_name 'britney'
    last_name 'spears'
    description 'lipsorum me'
    image File.open(File.join(Rails.root, '/spec/support/cat-mug-shot.jpg'))
    user
  end
end
