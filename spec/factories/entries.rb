FactoryGirl.define do
  factory :entry do
    title { generate :title }
    body { generate :body }

    blog
  end
end