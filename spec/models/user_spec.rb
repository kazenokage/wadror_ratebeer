require 'spec_helper'

describe User do
  it "has the username set correctly" do
    user = User.new username:"Pekka"

    user.username.should == "Pekka"
  end

  it "is saved with a proper password" do
    user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "with a proper password and two ratings, has the correct average rating" do
    user = User.create username:"Pekka", password:"Secret1", password_confirmation:"Secret1"
    rating = Rating.new score:10
    rating2 = Rating.new score:20

    user.ratings << rating
    user.ratings << rating2

    expect(user.ratings.count).to eq(2)
    expect(user.average_rating).to eq(15.0)
  end

  
end
