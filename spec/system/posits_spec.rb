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
RSpec.describe '呟きの削除', type: :system do
  before do
    @posit1 = FactoryBot.create(:posit)
    @user = FactoryBot.create(:user)
  end
  context '呟きが削除できる時' do
    it '自分の投稿には削除するボタンが表示され、ボタンを押すと呟きが削除される' do
      # マイページへ移動する
      visit posits_path
      # 正しいユーザー情報を入力する
      fill_in 'email', with: @posit1.user.email
      fill_in 'password', with: @posit1.user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 自分の投稿と削除ボタンがあることを確認する
      expect(
        all(".posit")[0].hover
      ).to have_link "削除する", href: posit_path(@posit1)
      # 削除ボタンを押した後、削除しますか？というボタンをクリックすると、その呟きが消え、positsテーブルのレコードが一つ減ったことが確認できる
      expect{
        all(".posit")[0].hover.find_link("削除する", href: posit_path(@posit1)).click
        expect(page.accept_confirm).to eq "削除しますか？"
        expect(page).to have_no_content("#{@posit1.posit}")
      }.to change { Posit.count }.by(-1)
    end
  end
  context '呟きが削除できない時' do
    it '呟きがあっても自分の投稿ではない時は削除できない' do
      # マイページへ移動する
      visit posits_path
      # 投稿とは別のユーザー情報を入力する
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 投稿はあるが削除ボタンがないことを確認する
      expect(
        all(".posit")[0].hover
      ).to have_no_link "削除する", href: posit_path(@posit1)
    end
  end
end