require 'rails_helper'

# RSpec.describe "ブログの作成", type: :system do
#   before do
#     @blog = FactoryBot.create(:blog)
#   end
#   context 'ブログの作成ができる時' do
#     it '正しい情報が登録されていればブログが作成でき、マイページに遷移する' do
#       # マイページへ移動する
#       visit posits_path
#       # 正しいユーザー情報を入力する
#       fill_in 'email', with: @blog.user.email
#       fill_in 'password', with: @blog.user.password
#       # ログインボタンを押す
#       find('input[name="commit"]').click
#       # ヘッダーに記事を書くボタンがあることを確認する
#       expect(page).to have_content("記事を書く")
#       # ブログ作成ページへ遷移する
#       visit new_blog_path
#       # 記事内容を入力する
#       fill_in 'blog_title', with: @blog.title
#       fill_in 'blog_text', with: @blog.text
#       # 投稿ボタンを押すとblogsテーブルのカウントが一つ上がる
#       expect do
#         find('input[name="commit"]').click
#       end.to change{ Blog.count }.by(1)
#       # マイページへ遷移したことを確認する
#       expect(current_path).to eq posits_path
#       # マイページに作成したブログのタイトルが表示されている
#       expect(page).to have_content("#{@blog.title}")
#     end
#   end
#   context 'ブログの作成ができない時' do
#     it '正しい情報が入力されないとブログ作成ページに遷移する' do
#       # マイページへ移動する
#       visit posits_path
#       # 正しいユーザー情報を入力する
#       fill_in 'email', with: @blog.user.email
#       fill_in 'password', with: @blog.user.password
#       # ログインボタンを押す
#       find('input[name="commit"]').click
#       # ヘッダーに記事を書くボタンがあることを確認する
#       expect(page).to have_content("記事を書く")
#       # ブログ作成ページへ遷移する
#       visit new_blog_path
#       # 記事内容を入力する
#       fill_in 'blog_title', with: ""
#       fill_in 'blog_text', with: ""
#       # 投稿ボタンを押す
#       find('input[name="commit"]').click
#       # ブログ作成ページに再び遷移する
#       expect(current_path).to eq "/blogs"
#     end
#   end
# end
RSpec.describe 'ブログの編集', type: :system do
  before do
    @blog = FactoryBot.create(:blog)
    @blog2 = FactoryBot.create(:blog)

  end
  context 'ブログが編集できる時' do
    it '自分のブログの詳細ページに遷移すると、編集ボタンが表示され、ボタンを押すと編集ページに遷移し編集できる' do
      # マイページへ移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @blog.user.email
      fill_in 'password', with: @blog.user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 編集したい自分のブログのタイトルをクリックする
      all('.blog')[1].hover.find_link(@blog.title.to_s, href: blogs_path(@blog)).click
      # 編集したいブログの詳細ページに遷移する
      visit blogs_path(@blog)
      # 編集するボタンをおす
      find_link('編集する', href: edit_blog_path(@blog)).click
      # ブログ内容を編集する
      fill_in 'blog_title', with: '新しいタイトル'
      fill_in 'blog_text', with: '新しい記事'
      # 更新ボタンを押してもレコードの数は変化せず、マイページに遷移する
      expect do
        find('input[name="commit"]').click
      end.to change { Blog.count }.by(0)
      # マイページでは編集されたブログのタイトルが表示されている
      expect(page).to have_content('新しいタイトル')
      # 編集されたブログの詳細へ飛ぶと、編集後のブログの記事に更新されている
      all('.blog')[1].hover.find_link('新しいタイトル', href: blogs_path(@blog)).click
      expect(page).to have_content('新しい記事')
    end
  end
  context 'ブログが編集できない時' do
    it '編集画面で正しく入力されていないと元の情報のままになる' do
      # マイページへ移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @blog.user.email
      fill_in 'password', with: @blog.user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 編集したい自分のブログのタイトルをクリックする
      all('.blog')[1].hover.find_link(@blog.title.to_s, href: blogs_path(@blog)).click
      # 編集したいブログの詳細ページに遷移する
      visit blogs_path(@blog)
      # 編集するボタンをおす
      find_link('編集する', href: edit_blog_path(@blog)).click
      # 誤った編集情報を入力する
      fill_in 'blog_title', with: ''
      fill_in 'blog_text', with: ''
      # 更新ボタンを押す
      find('input[name="commit"]').click
      # 編集ページに戻っている
      expect(current_path).to eq "/blogs/#{@blog.id}"
    end
    it '自分のブログでなければ編集できない' do
      # マイページへ移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @blog.user.email
      fill_in 'password', with: @blog.user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 自分以外のユーザーが作成したブログを選択する
      all(".blog")[0].hover.find_link(@blog2.title.to_s, href: blogs_path(@blog2)).click
      # 選択したブログの詳細にとぶ
      visit blogs_path(@blog2)
      # 編集ボタンがないことを確認する
      expect(page).to have_no_content("編集する")
    end
  end
end
