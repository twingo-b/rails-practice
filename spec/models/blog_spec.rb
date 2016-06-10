require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "#title" do
    it "titleがあれば有効な状態であること" do
      blog = Blog.new(title: 'Title')
      expect(blog.valid?).to be_truthy
    end

    it "titleがなければ無効な状態であること" do
      blog = Blog.new
      expect(blog.valid?).to be_falsey
    end
  end
end
