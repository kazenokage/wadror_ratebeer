module RatingAverage
  def average_rating
    return ratings.sum('score').to_f / ratings.count
  end
end