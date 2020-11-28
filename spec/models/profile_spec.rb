require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end
  describe 'profileの保存' do
    context 'profileの保存が上手く行く時' do
      it '正しく入力されていれば保存される' do
        expect(@profile).to be_valid
      end
      it '何も入力されなくても登録できる' do
        @profile.profile = ''
        expect(@profile).to be_valid
      end
    end
  end
end
