FactoryGirl.define do
  factory :comment do
    body 'Body'

    entry
  end

  factory :approved_comment, :class => 'Comment' do
    body 'Approved Body'
    status 'approved'

    entry
  end
end
