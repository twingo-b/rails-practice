class Entry < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true

  belongs_to :blogs
  has_many :comments, :dependent => :destroy

  scope :where_entry_not_exists, lambda {
    where(arel_table[:blog_id].eq(Blog.arel_table[:id])).exists.not
  }
end
