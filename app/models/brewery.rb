class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  validates :name, length: {minimum: 1}
  validates :year, numericality: { less_than_or_equal_to: ->(_) { Time.now.year} }

  #def average_rating
  #  ratings.sum('score').to_f / ratings.count
  #end

  def restart
    self.year = 2014
    puts "changed year to #{year}"
  end

end
