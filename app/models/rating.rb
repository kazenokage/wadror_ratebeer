class Rating < ActiveRecord::Base
  belongs_to :beer

  def to_s
    return beer_id + ' ' + score
  end

end
