require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context 'ユーザー登録できる時' do
    it '全ての値が正常に入力されていれば登録できる' do
      expect(@user).to be_valid
    end
    it 'パスワードは６文字以上の半角英数字混合で登録できる' do
    @user.password = '0000aaa'
    @user.password_confirmation = '0000aaa'
    expect(@user).to be_valid
    end
    it 'パスワードは、6文字以上での入力が必須であること（6文字が入力されていれば、登録が可能なこと）' do
      @user.password = '0000aaa'
      @user.password_confirmation = '0000aaa'
      expect(@user).to be_valid
  end
  end
end
end