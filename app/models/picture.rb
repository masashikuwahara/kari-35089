class Picture < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :image, presence: true
  validates :title, presence: true
  validates :explanation, presence: true
  validates :impression, presence: true
  
  def self.search(search)
    if search != ""
      Picture.where('title LIKE(?)', "%#{search}%")
    else
      Picture.all
    end
  end
end
