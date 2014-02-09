class Beer < ActiveRecord::Base
  include RatingAverage

  validates :name, length: {minimum: 1}
  validates :style, length: {minimum: 1}

  has_many :ratings, :dependent => :destroy
  has_many :raters, through: :ratings, source: :user

  belongs_to :brewery

  #def average_rating
    #ra_sum = 0.0
    #ratings.each do |rat|
    #  ra_sum += rat.score
    #end
    #ra_sum / ratings.count

   # ratings.sum('score').to_f / ratings.count
  #end

  def to_s
    "#{name} #{brewery.name}"
  end

end
