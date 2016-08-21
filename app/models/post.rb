class Post < ActiveRecord::Base
  belongs_to :city
  belongs_to :user
  
  validates :title, length: {in: 2..200}, presence: true
  validates :content, length: {in: 2..200}, presence: true
end
