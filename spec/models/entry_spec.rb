require 'rails_helper'

RSpec.describe Entry, type: :model do
  it 'titleとbodyがあれば有効な状態であること' do
    entry = build(:entry)
    expect(entry.valid?).to be_truthy
  end

  it 'titleがなければ無効な状態であること' do
    entry = build(:entry, title: nil)
    expect(entry.valid?).to be_falsey
  end

  it 'bodyがなければ無効な状態であること' do
    entry = build(:entry, body: nil)
    expect(entry.valid?).to be_falsey
  end
end
