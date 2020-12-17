require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail,passwordとpassword_confirmation,l_name,f_name,l_name_r,f_name_r,birthdayが存在すると登録できる' do
        expect(@user).to be_valid
      end
    end
  end