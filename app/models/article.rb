class Article < ApplicationRecord
  has_many_attached :covers
  
  belongs_to :user
  has_many :comments


  validates :title, presence: true, length: {maximum:14}
  validates :body, :covers, presence: true
end
