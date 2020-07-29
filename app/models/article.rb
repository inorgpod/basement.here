class Article < ApplicationRecord
  belongs_to :user, :optional => true
  
  validates :title, presence: true, length: {minimum:5}
  validates :body, presence: true
end
