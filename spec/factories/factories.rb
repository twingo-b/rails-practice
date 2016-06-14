FactoryGirl.define do
  sequence(:title) { Faker::Hipster.sentence }
  sequence(:body) { Faker::Hipster.paragraph }
end
