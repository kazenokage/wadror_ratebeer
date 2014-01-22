class Beer < ActiveRecord::Base
  has_many :ratings
  belongs_to :brewery

  def average_rating
    #ra_sum = 0.0
    #ratings.each do |rat|
    #  ra_sum += rat.score
    #end
    #ra_sum / ratings.count

    ratings.sum('score').to_f / ratings.count
  end

end
