# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tweet do
    author "MyString"
    body "MyString"
  end

  factory :tweet2 do
    author "MyString"
    body "MyString"
  end

  factory :invalid_tweet, parent: :tweet do
    author "MyString"
    body "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et mag"
  end
end
