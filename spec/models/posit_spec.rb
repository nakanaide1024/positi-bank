require 'rails_helper'

RSpec.describe Posit, type: :model do
  before do
    @posit = FactoryBot.build(:posit)
  end

  describe 'positの保存' do
    context 'posit保存がうまく行く時' do
      it 'positが正しく入力されていれば登録できる' do
        expect(@posit).to be_valid
      end
    end
    context 'posit保存がうまくいかない時' do
      it 'positが空では保存できない' do
        @posit.posit = ""
        @posit.valid?
        expect(@posit.errors.full_messages).to include("Posit can't be blank")
      end
      it "ユーザーが紐付いていないとpositは保存できない" do
        @posit.user = nil
        @posit.valid?
        expect(@posit.errors.full_messages).to include("User must exist")
      end
    end
  end
end
