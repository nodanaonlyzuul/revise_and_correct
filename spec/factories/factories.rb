FactoryBot.define do
  factory :twitter_account do
    screen_name 'MyString'
  end
end

FactoryBot.define do
  factory :user do
    name 'Example User'
    email 'address@example.com'
    screen_name 'example-screen-name'
  end
end
