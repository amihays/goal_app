FactoryGirl.define do
  factory :comment do
    body {Faker::hacker.say_something_smart}
  end

end
