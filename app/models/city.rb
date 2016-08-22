class City < ActiveRecord::Base
  # extend FriendlyId
  # friendly_id :name, use: [:slugged, :finders]

  has_many :posts
  has_many :users, :through => :posts


end
