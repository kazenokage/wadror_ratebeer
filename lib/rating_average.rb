module RatingAverage
  def average_rating
    return self.ratings.sum('score').to_f / self.ratings.count
  end
end