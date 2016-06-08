class Entry < ActiveRecord::Base
  belongs_to :blogs
  has_many :comments

  scope :where_entry_not_exists, lambda {
    where(arel_table[:blog_id].eq(Blog.arel_table[:id])).exists.not
  }
end
