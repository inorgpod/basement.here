class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :title, presence: true, length: {maximum:14}
  validates :body, presence: true
end
