class User < ApplicationRecord
  validates :username, uniqueness: true, length: { minimum: 3 }
  validates :password, length: { minimum: 4 }
  has_secure_password

  has_many :ratings   # user has many ratings
  has_many :beers, through: :ratings
  has_many :memberships
  has_many :beer_clubs, through: :memberships, source: :beer_club

  def favorite_beer
    return nil if ratings.empty?

    ratings.order(score: :desc).limit(1).first.beer
  end
end
