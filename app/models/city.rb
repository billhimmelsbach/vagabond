class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :posts
  has_many :users, :through => :posts

  attr_accessor :content, :title



end
