FactoryGirl.define do
  factory :comment do
    body 'Body'

    entry

    trait :approved do
      status 'approved'
    end
  end
end
