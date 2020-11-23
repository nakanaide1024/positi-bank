require 'rails_helper'

RSpec.describe '呟きの投稿', type: :system do
  before do
    @posit = FactoryBot.create(:posit)
  end
  context '新規投稿ができる時' do
    it '正しい情報を入力すれば新規投稿ができ、マイページへ遷移する' do
      # マイページへ移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @posit.user.email
      fill_in 'password', with: @posit.user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ヘッダーに投稿するボタンがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページへ遷移する
      visit new_posit_path
      # 投稿内容を入力する
      fill_in 'posit', with: @posit.posit
      # 投稿ボタンを押すとpositsテーブルのカウントが1上がる
      expect do
        find('input[name="commit"]').click
      end.to change { Posit.count }.by(1)
      # マイページに遷移したことを確認する
      expect(current_path).to eq posits_path
      # 投稿した文章が表示されているか確認する
      expect(page).to have_content("#{@posit.posit}")
    end
  end
  context '新規投稿ができない時' do
    it '呟き内容が空だと投稿できない' do
       # マイページへ移動する
       visit posits_path
       # 正しいユーザー情報を入力する
       fill_in 'email', with: @posit.user.email
       fill_in 'password', with: @posit.user.password
       # ログインボタンを押す
       find('input[name="commit"]').click
       # ヘッダーに投稿するボタンがあることを確認する
       expect(page).to have_content('投稿する')
       # 投稿ページへ遷移する
       visit new_posit_path
       # 投稿内容を入力する
       fill_in 'posit', with: ""
       # 投稿ボタンを押す
       find('input[name="commit"]').click
       # 投稿ページへ戻ることを確認する
       expect(current_path).to eq "/posits"
    end
  end
end