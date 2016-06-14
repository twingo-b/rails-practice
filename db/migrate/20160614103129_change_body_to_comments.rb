class ChangeBodyToComments < ActiveRecord::Migration
  def self.up
    change_column :comments, :body, :text, null: true
  end

  def self.down
    change_column :comments, :body, :string, null: true
  end
end
