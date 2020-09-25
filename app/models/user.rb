class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :items
         has_many :item_purchases  # commentsテーブルとのアソシエーション

         validates :password, format: { with:/[a-z\d]/i}
         validates :email, format: { with:/@.+/}

end
