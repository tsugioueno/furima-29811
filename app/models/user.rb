class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :item_purchases  # commentsテーブルとのアソシエーション

         validates :nick_name, presence: true
         validates :email, presence: true, format: { with:/@.+/}
         validates :password, presence: true, format: { with:/[a-z\d]{6,}/i}
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
         validates :birthday, presence: true

end
