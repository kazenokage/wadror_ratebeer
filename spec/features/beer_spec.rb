require 'spec_helper'
include OwnTestHelper

describe "Beer" do
  before :each do
    FactoryGirl.create :user
  end

  it "can be created and be found" do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    fill_in('Name', with:'Tuplahumala')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(1)
  end

  it "wont be created if empty name" do
    sign_in(username:"Pekka", password:"Foobar1")
    visit new_beer_path
    fill_in('beer_name', with:'')

    expect{
      click_button('Create Beer')
    }.to change{Beer.count}.by(0)
  end
end