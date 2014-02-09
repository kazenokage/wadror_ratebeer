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

  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  def favorite_style
    return nil if ratings.empty?
    beers_by_style.order(score: :desc)
  end

  def favorite_brewery
    return nil if ratings.empty?
    nil
  end

  def beers_by_style
    user_rated_beers
  end

  def user_rated_beers
    self.beers
  end

end
