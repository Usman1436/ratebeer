class Brewery < ApplicationRecord
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers
  validates :name, presence: true

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

  def restart
    self.year = 2022
    puts "changed year to #{year}"
  end

  def rating_sum
    return 0 if ratings.empty?

    ratings.map(&:score).sum.to_f / ratings.count
  end
end
