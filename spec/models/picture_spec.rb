require 'rails_helper'

RSpec.describe Picture, type: :model do
  before do
    @picture = FactoryBot.build(:picture)
  end

  describe '画像投稿機能' do
    context '画像投稿できる' do
      it '内容が正しければ投稿できる' do
        expect(@picture).to be_valid
      end
    end

    context '画像投稿できない時' do
    it '画像が空だと登録できない' do
      @picture.image = nil
      @picture.valid?
      expect(@picture.errors.full_messages).to include("Image can't be blank")
    end
    it 'タイトルが空だと登録できない' do
      @picture.title = ''
      @picture.valid?
      expect(@picture.errors.full_messages).to include("Title can't be blank")
    end
    it 'タイトルの説明が空だと登録できない' do
      @picture.explanation = ''
      @picture.valid?
      expect(@picture.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'タイトルの感想が空だと登録できない' do
      @picture.impression = ''
      @picture.valid?
      expect(@picture.errors.full_messages).to include("Impression can't be blank")
    end
  end
end
end
