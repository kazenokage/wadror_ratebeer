class Style < ActiveRecord::Base
  has_many :beers
  has_many :ratings, :through => :beers
end
