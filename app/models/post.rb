class Post < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  validates :content, length: { in: 1..200}, presence: true
end
