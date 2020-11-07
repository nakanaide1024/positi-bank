require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が上手くいく時' do
      it 'nickname,email,password,password_confirmationが正しく存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録が上手くいかない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '既に登録されているnicknameは登録できない' do
        @user.save
        anuther_user = FactoryBot.build(:user)
        anuther_user.nickname = @user.nickname
        anuther_user.valid?
        expect(anuther_user.errors.full_messages).to include('Nickname has already been taken')
      end
      it 'nicknameが3文字未満では登録できない' do
        @user.nickname = 'tt'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too short (minimum is 3 characters)')
      end
      it 'nicknameが11文字以上では登録できない' do
        @user.nickname = 'aaaaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 10 characters)')
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '既に登録されているemailは登録できない' do
        @user.save
        anuther_user = FactoryBot.build(:user)
        anuther_user.email = @user.email
        anuther_user.valid?
        expect(anuther_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないものは登録できない' do
        @user.email = 'aofononsnonis.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが６文字未満では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが存在していなければ登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの値が一致しないと登録できない' do
        @user.password = "\baaaa11"
        @user.password_confirmation = "\baaaa22"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordに全角英数字が入っている場合は登録できない' do
        @user.password = "\bAAa５５5"
        @user.password_confirmation = "\bAAa５５5"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "\baaaaaa"
        @user.password_confirmation = "\baaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = "\b111111"
        @user.password_confirmation = "\b111111"
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end
