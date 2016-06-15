require 'rails_helper'

RSpec.feature 'Blogs', type: :feature do
  scenario 'Blogの新規作成時にtitleを入力しなかった場合にエラーが表示されること' do
    visit blogs_path
    click_link 'New Blog'
    click_button 'Save'

    expect(current_path).to eq blogs_path
    expect(page).to have_content "Title can't be blank"

  end

  scenario 'Blogの新規作成時にtitleを入力した場合はデータが保存され閲覧画面に遷移すること' do
    visit blogs_path
    click_link 'New Blog'
    fill_in 'Title', with: 'title'

    expect {
      click_button 'Save'
    }.to change(Blog, :count).by(1)

    expect(current_path).to eq blog_path(Blog.first.id)
    expect(page).to have_content 'Blog was successfully created.'
  end

  scenario 'Blogの削除時の確認をCancelした場合はデータが削除されないこと', js: true do
    create(:blog)

    visit blogs_path

    expect {
      dismiss_confirm do
        click_link 'Destroy'
      end
    }.to change(Blog, :count).by(0)

    expect(current_path).to eq blogs_path
  end

  scenario 'Blogの削除時の確認をOKした場合はデータが削除され一覧に遷移すること', js: true do
    create(:blog)

    visit blogs_path

    expect {
      accept_confirm do
        click_link 'Destroy'
      end
    }.to change(Blog, :count).by(-1)

    expect(current_path).to eq blogs_path
    expect(page).to have_content 'Blog was successfully destroyed.'
  end
end
