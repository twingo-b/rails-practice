require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  describe 'GET #index' do
    it '@blogsに全てのBlogが入っていること' do
      @blogs = [
          create(:blog),
          create(:blog),
          create(:blog)
      ]
      get :index
      expect(assigns(:blogs)).to eq(@blogs)
    end
  end

  describe 'POST #create' do
    it '新規作成後に@blogのshowに遷移すること' do
      post :create, blog: attributes_for(:blog)
      expect(response).to redirect_to blog_path(assigns[:blog])
    end
  end
end
