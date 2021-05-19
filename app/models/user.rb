class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :books, dependent: :destroy
   #attachment :name, :image, :introduction
   #mount_uploader :image, ImageUploader



end
