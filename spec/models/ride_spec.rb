require 'rails_helper'

RSpec.describe Ride do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :thrill_rating}
  end
  describe 'relationships' do
    it {should have_many :mechanic_rides}
    it {should have_many(:mechanics).through(:mechanic_rides)}
  end
  describe 'methods' do
    it '#average_thrill_rating' do
      amusement_park_1 = AmusementPark.create!(name: "Hershey Park", admission_price: "$50.00")
      ride_1 = amusement_park_1.rides.create!(name: "Lightning Racer", thrill_rating: 10.0)
      ride_2 = amusement_park_1.rides.create!(name: "Storm Runner", thrill_rating: 7.5)
      ride_3 = amusement_park_1.rides.create!(name: "The Great Bear", thrill_rating: 8.3)

      expect(Ride.average_thrill_rating).to eq(8.6)
    end
  end
end
