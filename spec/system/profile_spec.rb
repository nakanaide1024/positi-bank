require 'rails_helper'

RSpec.describe 'プロフィールの登録', type: :system do
  before do
    @profile = FactoryBot.build(:profile)
    @user = FactoryBot.create(:user)
  end
  context 'プロフィールの登録ができる時' do
    it '正しい手順であればプロフィールの登録ができる' do
      # マイページに移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 登録ボタンをクリックする
      find_link('登録する', href: new_profile_path).click
      # プロフィールを入力する
      fill_in 'profile_profile', with: @profile.profile
      # 登録ボタンをクリックするとプロフィールテーブルのレコードが一つ増えている
      expect  do
        find('input[name="commit"]').click
      end.to change { Profile.count }.by(1)
      # マイページに遷移してるのを確認する
      expect(current_path).to eq posits_path
    end
  end
end
RSpec.describe 'プロフィールの編集機能' do
  before do
    @profile = FactoryBot.create(:profile)
  end
  context 'プロフィールが編集できる時' do
    it 'マイページに編集ボタンがあれば編集できる' do
      # マイページに移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @profile.user.email
      fill_in 'password', with: @profile.user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # ボタンをクリックする
      find_link('編集する', href: edit_profile_path(@profile)).click
      # プロフィールを入力する
      fill_in 'profile_profile', with: '新しいプロフィール'
      # 編集ボタンをクリックしてもプロフィールテーブルのレコードは増えない
      expect  do
        find('input[name="commit"]').click
      end.to change { Profile.count }.by(0)
      # マイページに遷移してるのを確認する
      expect(current_path).to eq posits_path
    end
  end
end
