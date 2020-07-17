require 'rails_helper'

RSpec.describe "amusement park show page" do
  it "displays the details of a particular amusement park" do
    amusement_park_1 = AmusementPark.create!(name: "Hershey Park", admission_price: "$50.00")
    ride_1 = amusement_park_1.rides.create!(name: "Lightning Racer", thrill_rating: 10.0)
    ride_2 = amusement_park_1.rides.create!(name: "Storm Runner", thrill_rating: 7.5)
    ride_3 = amusement_park_1.rides.create!(name: "The Great Bear", thrill_rating: 8.3)

    visit "/amusement_parks/#{amusement_park_1.id}"

    expect(page).to have_content(amusement_park_1.name)
    expect(page).to have_content(amusement_park_1.admission_price)

    expect(page).to have_content("Rides:")
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)

    expect(page).to have_content("Average Thrill Rating of Rides:")
    expect(page).to have_content(Ride.average_thrill_rating)
  end
end
