class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true
         validates :favorite, presence: true
         validates :museum, presence: true
         has_many :pictures
end
