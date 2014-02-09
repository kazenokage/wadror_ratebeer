require 'spec_helper'

describe Beer do
  let(:user){FactoryGirl.create(:user) }

  it "is saved with proper name and style" do
    testbeer = Beer.create name:"Testbeer", style:"Lager"
    expect(testbeer.valid?).to be(true)
    expect(Beer.count).to eq(1)
  end

  it "is not created if no name is provided" do
    testbeer = Beer.create name:"", style:"Lager"
    expect(testbeer.valid?).to be(false)
    expect(Beer.count).to eq(0)
  end

  it "is not created if no style is provided" do
    testbeer = Beer.create name:"TestBier"
    expect(testbeer.valid?).to be(false)
    expect(Beer.count).to eq(0)
  end

  it "is the only rated if only one rating" do
    beer = FactoryGirl.create(:beer)
    rating = FactoryGirl.create(:rating, beer:beer, user:user)

    expect(user.favorite_beer).to eq(beer)
  end

  it "is the one with highest rating if several rated" do
    create_beer_with_rating(10, user)
    best = create_beer_with_rating(25, user)
    create_beer_with_rating(7, user)
    expect(user.favorite_beer).to eq(best)
  end
end

def create_beer_with_rating(score, user)
  beer = FactoryGirl.create(:beer)
  FactoryGirl.create(:rating, score:score, beer:beer, user:user)
  beer
end

def create_beers_with_ratings(*scores, user)
  scores.each do |score|
    create_beer_with_rating(score, user)
  end
end
