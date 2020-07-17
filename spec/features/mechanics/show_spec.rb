require 'rails_helper'

RSpec.describe "Mechanics show page" do
  it "displays mechanics's details" do
    amusement_park_1 = AmusementPark.create!(name: "Hershey Park", admission_price: "$50.00")
    ride_1 = amusement_park_1.rides.create!(name: "Lightning Racer", thrill_rating: 10.0)
    ride_2 = amusement_park_1.rides.create!(name: "Storm Runner", thrill_rating: 7.5)
    ride_3 = amusement_park_1.rides.create!(name: "The Great Bear", thrill_rating: 8.3)
    ride_4 = amusement_park_1.rides.create!(name: "The Frog Hopper", thrill_rating: 7.0)
    mechanic_1 = Mechanic.create!(name: "Sam Mills", years_of_experience: 10)
    MechanicRide.create!(mechanic: mechanic_1, ride: ride_1)
    MechanicRide.create!(mechanic: mechanic_1, ride: ride_2)
    MechanicRide.create!(mechanic: mechanic_1, ride: ride_3)

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_of_experience)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(page).to_not have_content(ride_4.name)

    expect(page).to have_content("Add ride to workload")
    fill_in :ride_id, with: ride_4.id
    click_on "Submit"

    expect(current_path).to eq("/mechanics/#{mechanic_1.id}")
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(page).to have_content(ride_4.name)
  end
end
