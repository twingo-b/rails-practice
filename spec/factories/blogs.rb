FactoryGirl.define do
  factory :blog do
    title { generate :title }
  end
end
