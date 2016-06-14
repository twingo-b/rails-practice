require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'bodyがあれば有効な状態であること' do
    comment = build(:comment)
    expect(comment.valid?).to be_truthy
  end

  it 'bodyがなければ無効な状態であること' do
    comment = build(:comment, body: nil)
    expect(comment.valid?).to be_falsey
  end

  describe '#status' do
    context 'commentが新規作成の時' do
      it 'statusの初期値にunapprovedがセットされていること' do
        comment = build(:comment)
        expect(comment.status).to eq 'unapproved'
      end
    end

    context 'commentが作成済みの時' do
      it 'statusが書き換わらないこと' do
        comment = create(:comment, :approved)
        expect(Comment.find(comment.id).status).to eq 'approved'
      end
    end
  end

  describe '#mask_unapproved_body' do
    context 'statusがunapprovedの時' do
      it 'マスク済みのbodyを返す' do
        comment = build(:comment)
        expect(comment.mask_unapproved_body).to eq '(承認待ち)'
      end
    end

    context 'statusがapprovedの時' do
      it 'bodyをそのまま返す' do
        comment = build(:comment, :approved)
        expect(comment.mask_unapproved_body).to eq comment.body
      end
    end
  end
end
