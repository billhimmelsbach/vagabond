class Post < ActiveRecord::Base
  belongs_to :city
  belongs_to :user

  validates :title, length: {in: 2..200}, presence: true
  validates :content, length: {in: 2..2000}, presence: true

  before_save :set_default_image

  private

  def set_default_image
    self.image ||= "http://www.fantasticviewpoint.com/wp-content/uploads/2016/07/travel.jpg"
  end

end
