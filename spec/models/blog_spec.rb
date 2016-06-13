require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'titleがあれば有効な状態であること' do
    # blog = build :blog
    blog = build(:blog)
    expect(blog.valid?).to be_truthy
  end

  it 'titleがなければ無効な状態であること' do
    blog = build(:blog, title: nil)
    expect(blog.valid?).to be_falsey
  end
end
