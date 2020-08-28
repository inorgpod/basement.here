class Article < ApplicationRecord
  acts_as_taggable_on :tags
  
  has_many_attached :covers
  has_many :comments 
  # has_many :taggings
  # has_many :tags, through: :taggings
  
  belongs_to :user
  

  validates :title, presence: true, length: {maximum:14}
  validates :body, :covers, presence: true
end
