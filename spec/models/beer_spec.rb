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
    beer1 = FactoryGirl.create(:beer)
    beer2 = FactoryGirl.create(:beer)
    beer3 = FactoryGirl.create(:beer)
    rating1 = FactoryGirl.create(:rating, beer:beer1, user:user)
    rating2 = FactoryGirl.create(:rating, score:25,  beer:beer2, user:user)
    rating3 = FactoryGirl.create(:rating, score:9, beer:beer3, user:user)
    expect(user.favorite_beer).to eq(beer2)
  end
end
