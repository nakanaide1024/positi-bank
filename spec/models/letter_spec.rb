require 'rails_helper'

RSpec.describe Letter, type: :model do
  before do
    @thanks = FactoryBot.build(:letter)
  end
  describe '感謝状の保存' do
    context '感謝状が保存できる時' do
      it '感謝状の内容が入力されていれば保存できる' do
        expect(@thanks).to be_valid
      end
    end
    context '感謝状が保存できない時' do
      it '感謝状の内容が入力されていなければ保存できない' do
        @thanks.thanks = ''
        @thanks.valid?
        expect(@thanks.errors.full_messages).to include("Thanks can't be blank")
      end
    end
  end
end
