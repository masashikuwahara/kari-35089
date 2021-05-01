class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
         validates :name
         validates :favorite
         validates :museum
         validates :password
         validates :password_confirmation

         end
         
         has_many :pictures
         has_many :comments, dependent: :destroy
      
end
