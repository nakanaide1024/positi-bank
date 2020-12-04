require 'rails_helper'

RSpec.describe '感謝状の登録', type: :system do
  before do
    @thanks = FactoryBot.build(:letter_address)
    @user = FactoryBot.create(:user)
    @posit = FactoryBot.create(:posit)
  end
  context '感謝状が登録できる時' do
    it '感謝状の本文が入力されていれば登録ができる' do
       # マイページに移動する
       visit posits_path
       # 正しいユーザー情報を入力する
       fill_in 'email', with: @user.email
       fill_in 'password', with: @user.password
       # ログインボタンを押す
       find('input[name="commit"]').click
       # 送りたいユーザーのページへ遷移する
       visit user_path(@posit.user.id)
       # 感謝状を送るボタンを押す
       find_link('感謝状を送る', href: new_user_address_path(@posit.user.id)).click
       # 感謝状の入力フォームに遷移する
       visit new_user_address_path(@posit.user.id)
       # 感謝状の内容を入力する
       fill_in 'letter_address_thanks', with: @thanks.thanks
       # 感謝状を送るボタンを押すとaddressテーブルとletterテーブルのレコードが増える
       expect do
        find('input[name="commit"]').click
       end.to change { Letter.count }.by(1).and change { Address.count }.by(1)
       # マイページに遷移していることを確認する
       expect(current_path).to eq posits_path
    end
  end
end