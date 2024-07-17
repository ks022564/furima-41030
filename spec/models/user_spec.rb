require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが必須であること' do
      user = User.new(nickname: '', email: 'test@example', password: 'a00000', password_confirmation: 'a00000', first_name: '山田',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birthday: '1990/2/22')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      user = User.new(nickname: 'たろう', email: '', password: 'a00000', password_confirmation: 'a00000', first_name: '山田',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birthday: '1990/2/22')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      user = User.new(nickname: 'rg', email: 'test@example', password: '', password_confirmation: '', first_name: '山田',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birthday: '1990/2/22')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'お名前(全角)は、名前が必須であること' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'お名前(全角)は、名字が必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = '漢字・ひらがな・カタカナ'
      @user.last_name = '漢字・ひらがな・カタカナ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角文字を使用してください', 'Last name 全角文字を使用してください')
    end
    it 'お名前カナ(全角)は、名字がそれぞれ必須であること' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'お名前カナ(全角)は、名前がそれぞれ必須であること' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = '漢字・ひらがな'
      @user.last_name_kana = '漢字・ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 全角カタカナを使用してください', 'Last name kana 全角カタカナを使用してください')
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
