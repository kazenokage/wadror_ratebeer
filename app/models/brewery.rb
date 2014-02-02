class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  validates :name, length: {minimum: 1}
  validates :established, numericality: {greater_than_or_equal_to: 1042, less_than_or_equal_to: 2014}

  #def average_rating
  #  ratings.sum('score').to_f / ratings.count
  #end

end
