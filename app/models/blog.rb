class Blog < ActiveRecord::Base
  validates :title, :presence => true
  has_many :entries, :dependent => :destroy
end
