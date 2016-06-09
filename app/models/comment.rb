class Comment < ActiveRecord::Base
  validates :body, :presence => true

  belongs_to :entry

  after_initialize :set_default, if: :new_record?

  def mask_unapproved_body
    self.status == 'approved' ? self.body : '(承認待ち)'
  end

  private
    def set_default
      self.status ||= 'unapproved'
    end
end
