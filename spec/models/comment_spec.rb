require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "#status" do
    it "statusの初期値にunapprovedがセットされていること" do
      comment = Comment.new(body: 'Body')
      expect(comment.status).to eq 'unapproved'
    end

    it "すでに存在しているstatusが書き換わらないこと" do
      comment = Comment.create(body: 'Body', status: 'approved')
      expect(Comment.find(comment.id).status).to eq 'approved'
    end
  end

  describe "mask_unapproved_body" do
    it "statusがunapprovedの時は、マスク済みのbodyを取得する" do
      comment = Comment.new(body: 'Body')
      expect(comment.mask_unapproved_body).to eq '(承認待ち)'
    end
  end
end
