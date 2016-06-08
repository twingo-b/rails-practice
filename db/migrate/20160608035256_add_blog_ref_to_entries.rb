class AddBlogRefToEntries < ActiveRecord::Migration
  def change
    add_reference :entries, :blog, index: true, foreign_key: true
  end
end
