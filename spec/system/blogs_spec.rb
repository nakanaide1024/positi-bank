require 'rails_helper'

RSpec.describe "ブログの作成", type: :system do
  before do
    @blog = FactoryBot.create(:blog)
  end
  context 'ブログの作成ができる時' do
    it '正しい情報が登録されていればブログが作成でき、マイページに遷移する' do
      # マイページへ移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @blog.user.email
      fill_in 'password', with: @blog.user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ヘッダーに記事を書くボタンがあることを確認する
      expect(page).to have_content("記事を書く")
      # ブログ作成ページへ遷移する
      visit new_blog_path
      # 記事内容を入力する
      fill_in 'title', with: @blog.title
      fill_in 'text', with: @blog.text
      # 投稿ボタンを押すとblogsテーブルのカウントが一つ上がる
      expect do
        find('input[name="commit"]').click
      end.to change( Blog.count ).by(1)
      # マイページへ遷移したことを確認する
      expect(page).to eq posits_path
    end
  end
end