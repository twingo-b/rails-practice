FactoryGirl.define do
  factory :comment do
    body 'Body'

    entry
  end

  trait :approved do
    status 'approved'
  end
end
