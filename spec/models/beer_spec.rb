require 'rails_helper'

RSpec.describe Beer, type: :model do
  

  it "can be created and stored in the database with valid attributes" do
    brewery = Brewery.create(name: "Test Brewery", year: 2000)
    beer = Beer.create(name: "Test Beer", style: "IPA", brewery: brewery)

    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end

  it "won't be created without a name" do
    beer = Beer.create(style: "IPA")

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "won't be created without a style" do
    brewery = Brewery.create(name: "Test Brewery", year: 2000)
    beer = Beer.create(name: "Test Beer", brewery: brewery)

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

  it "won't be created without a brewery" do
    beer = Beer.create(name: "Test Beer", style: "IPA")

    expect(beer).not_to be_valid
    expect(Beer.count).to eq(0)
  end

end