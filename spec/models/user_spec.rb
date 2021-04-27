require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる時' do
    it "全ての値が正常に入力されていれば登録できる" do
      expect(@user).to be_valid
    end
    it "パスワードは６文字以上の半角英数字混合で登録できる" do
    @user.password = '0000aaa'
    @user.password_confirmation = '0000aaa'
    expect(@user).to be_valid
    end
    it "パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）" do
      @user.password = '0000aaa'
      @user.password_confirmation = '0000aaa'
      expect(@user).to be_valid
    end
  end

  context 'ユーザー情報できない時' do
    it "ユーザー名が必須であること" do
     @user.name = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "メールアドレスが必須であること" do
     @user.email = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank")
   end
   it "メールアドレスが一意性であること" do
     @user.save
     another_user = FactoryBot.build(:user)
     another_user.email = @user.email
     another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
   end
   it "メールアドレスは、@を含む必要があること" do
     @user.email = 'sampleemail.com'
     @user.valid?
     expect(@user.errors.full_messages).to include("Email is invalid")
   end
   it "パスワードが必須であること" do
     @user.password = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Password can't be blank")
   end
   it "パスワードは、５文字以下では登録できない" do
       @user.password = '00aa'
       @user.password_confirmation = '00aa'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end
   it "パスワードとパスワード（確認用）は、値の一致が必須であること" do
     @user.password = '000aaa'
     @user.password_confirmation = 'aaa000'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end
 end
end
end