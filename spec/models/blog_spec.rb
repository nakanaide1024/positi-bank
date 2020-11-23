require 'rails_helper'

RSpec.describe Blog, type: :model do
  before do
    @blog = FactoryBot.build(:blog)
  end

  describe 'blogの保存' do
    context 'blogの保存がうまくいく時' do
      it 'blogが正しく入力されていれば登録できる' do
        expect(@blog).to be_valid
      end
      it 'blogの画像がなくても登録できる' do
        @blog.image = nil
        expect(@blog).to be_valid
      end
    end
    context 'blogの保存がうまく行かない時' do
      it 'タイトルとテキストが入力されなければ登録できない' do
        @blog.title = ""
        @blog.text = ""
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Text can't be blank", "Title can't be blank")
      end
      it 'テキストだけ入力されていてもタイトルが入力されていなければ登録できない'do
        @blog.title = ""
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Title can't be blank")
      end
      it 'タイトルだけ入力されていてもテキストが入力されていなければ登録できない'do
        @blog.text = ""
        @blog.valid?
        expect(@blog.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
 
end
