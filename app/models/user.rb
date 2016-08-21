class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :cities, :through => :posts
  validates :email, uniqueness: true
  validates :first_name, length: { in: 2..30}, presence: true
  validates :last_name, length: { in: 2..30}, presence: true
  validates :current_city, length: { in: 2..20}, presence: true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end
end
