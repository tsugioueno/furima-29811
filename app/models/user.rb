class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :item_purchases  # commentsテーブルとのアソシエーション

         with_options presence: true do
         validates :nick_name
         validates :email, format: { with:/@.+/}
         validates :password, format: { with:/[a-z\d]{6,}/i}
         validates :first_name
         validates :last_name
         validates :first_name_kana
         validates :last_name_kana
         validates :birthday
         end

         with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は漢字、カタカナ、ひらがなで入力して下さい。'} do
          validates :first_name
          validates :last_name
         end

         with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'} do
          validates :first_name_kana
          validates :last_name_kana
         end
end
