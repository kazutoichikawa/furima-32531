# require 'rails_helper'

# RSpec.describe User, type: :model do
#   before do
#     @user = FactoryBot.build(:user)
#   end
  
#   describe 'ユーザー新規登録' do
#     context '新規登録がうまくいくとき' do
#       it 'nicknameとemail,passwordとpassword_confirmation,l_name,f_name,l_name_r,f_name_r,birthdayが存在すると登録できる' do
#         expect(@user).to be_valid
#       end

#       it 'passwordが6文字以上かつ、英数字があれば登録できる' do
#         @user.password = 'test12'
#         @user.password_confirmation = 'test12'
#         expect(@user).to be_valid
#       end
#     end
  
#     context '新規登録がうまくいかないとき' do
#       it 'nicknameが空では登録できない' do
#         @user.nickname = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Nickname can't be blank"
#       end
#       it 'emailが空では登録できない' do
#         @user.email = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Email can't be blank"
#       end
#       it 'emailに@が含まれなければ登録できない' do
#         @user.email = "samplesample.jp"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Email is invalid"
#       end
#       it 'emailが一意性でなければ登録できない' do
#         @user.save
#         another_user = FactoryBot.build(:user)
#         another_user.email = @user.email
#         another_user.valid?
#         expect(another_user.errors.full_messages).to include "Email has already been taken"
#       end
#       it 'passwordが空では登録できない' do
#         @user.password = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Password can't be blank"
#       end
#       it 'passwordが5文字以下では登録できない' do
#         @user.password = "sampl1"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
#       end
#       it 'passwordが数字だけだと登録できない' do
#         @user.password = "111111"
#         @user.password_confirmation = "111111"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Password is invalid"
#       end
#       it 'passwordが英語だけだと登録できない' do
#         @user.password = "aaaaaa"
#         @user.password_confirmation = "aaaaaa"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Password is invalid"
#       end
#       it 'passwordがに記号が含まれると登録できない' do
#         @user.password = "@aaaa1"
#         @user.password_confirmation = "@aaaa1"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Password is invalid"
#       end
#       it 'password_confirmationが空だと登録できない' do
#         @user.password_confirmation = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
#       end
#       it 'passwordとpassword_confirmationが一致していなければ登録できない' do
#         @user.password_confirmation = "test56"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
#       end
#       it 'l_name_rが空だと登録できない' do
#         @user.l_name = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "L name can't be blank"
#       end
#       it 'f_name_rが空だと登録できない' do
#         @user.f_name = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "F name can't be blank"
#       end
#       it 'l_name_rが空だと登録できない' do
#         @user.l_name_r = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "L name r can't be blank"

#       end
#       it 'f_name_rが空だと登録できない' do
#         @user.f_name_r = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "F name r can't be blank"
#       end
#       it 'l_nameが半角だと登録できない' do
#         @user.l_name = "ﾀﾅｶ"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "L name is invalid"
#       end
#       it 'f_nameが半角だと登録できない' do
#         @user.f_name = "ﾀﾛｳ"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "F name is invalid"

#       end
#       it 'l_name_rが半角カナだと登録できない' do
#         @user.l_name_r = "ﾀﾅｶ"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "L name r is invalid"
#       end
#       it 'l_name_rが漢字だと登録できない' do
#         @user.l_name_r = "田中"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "L name r is invalid"
#       end
#       it 'l_name_rが英語だと登録できない' do
#         @user.l_name_r = "tanaka"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "L name r is invalid"
#       end
#       it 'f_name_rが半角カナだと登録できない' do
#         @user.f_name_r = "ﾀﾛｳ"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "F name r is invalid"
#       end
#       it 'f_name_rが漢字だと登録できない' do
#         @user.f_name_r = "太郎"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "F name r is invalid"
#       end
#       it 'f_name_rが英語だと登録できない' do
#         @user.f_name_r = "tarou"
#         @user.valid?
#         expect(@user.errors.full_messages).to include "F name r is invalid"
#       end
#       it 'birthdayが空だと登録できない' do
#         @user.birthday = ""
#         @user.valid?
#         expect(@user.errors.full_messages).to include "Birthday can't be blank"
#       end
#     end
#   end
# end
