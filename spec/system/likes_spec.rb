require 'rails_helper'

RSpec.describe '呟きのステキ機能', type: :system do
  before do
    @posit = FactoryBot.create(:posit)
    @user = FactoryBot.create(:user)
  end
  context 'ステキをする時' do
    it 'まだ自分がステキボタンを押していない他ユーザーの呟きであればボタンを押すと縁が増える', js: true do
      # マイページへ移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 縁が０なのを確認する
      expect(page).to have_content('0縁')
      # まだ自分が押していない他ユーザーの呟きのステキボタンを押すとlikesテーブルのレコードが一つ増える
      expect do
        all('.posit')[0].hover.find('.likes').click
        sleep 5
      end.to change { Like.count }.by(1)
    end
  end
end