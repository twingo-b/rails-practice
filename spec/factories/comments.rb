FactoryGirl.define do
  factory :comment do
    body { generate :body }

    entry

    trait :approved do
      status 'approved'
    end
  end
end
