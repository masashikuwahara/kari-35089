class Picture < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :impression, presence: true
end
