module RatingAverage
  def average_rating
    ratings.average :score
    #return self.ratings.sum('score').to_f / self.ratings.count
  end
end