class User < ActiveRecord::Base
  include RatingAverage

  has_secure_password

  validates :username, uniqueness: true
  validates :username, length: {minimum: 3, maximum: 15}
  validates :password, length: {minimum: 3},
                       format: {with: /.*(\d.*[A-Z]|[A-Z].*\d).*/, message: "Should contain a uppercase letter and a number"}

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beer_clubs, through: :memberships

end
