class User < ActiveRecord::Base
  has_secure_password
  # extend FriendlyId
  # friendly_id :first_name, use: [:slugged, :finders]

  has_many :posts
  has_many :cities, :through => :posts

  validates :email, uniqueness: true
  validates :first_name, length: { in: 2..30}, presence: true
  validates :last_name, length: { in: 2..30}, presence: true
  validates :current_city, length: { in: 2..20}, presence: true

  def self.confirm(params)
    @user = User.where("email ILIKE ?", params[:email]).first
    @user.try(:authenticate, params[:password])
  end

  def city_count
    @city_count ||= cities.distinct.count
  end

  def post_count
    @post_count ||= posts.count
  end

end
