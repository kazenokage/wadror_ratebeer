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

  it "does not accept unvalid passwords" do
    user = User.create username:"Matti", password:"ab", password_confirmation:"ab"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
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

describe "with a proper password" do
  let(:user){ FactoryGirl.create(:user) }

  it "is saved" do
    expect(user).to be_valid
    expect(User.count).to eq(1)
  end

  it "and with two ratings, has the correct average rating" do
    user.ratings << FactoryGirl.create(:rating)
    user.ratings << FactoryGirl.create(:rating2)

    expect(user.ratings.count).to eq(2)
    expect(user.average_rating).to eq(15.0)
  end
end

describe "favorite beer" do
  let(:user){FactoryGirl.create(:user) }

  it "has method for determining one" do
    user.should respond_to :favorite_beer
  end

  it "without ratings does not have one" do
    expect(user.favorite_beer).to eq(nil)
  end
end


