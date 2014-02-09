class BeerClub < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :membership, source: :user
end
