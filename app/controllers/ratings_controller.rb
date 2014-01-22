class RatingsController < ApplicationController
  def index
    @Ratings = Rating.all
  end
end