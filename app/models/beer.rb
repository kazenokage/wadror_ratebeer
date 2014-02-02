class Beer < ActiveRecord::Base
  include RatingAverage

  validates :name, length: {minimum: 1}

  has_many :ratings, :dependent => :destroy
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
