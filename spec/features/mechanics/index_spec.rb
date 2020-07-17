require 'rails_helper'

RSpec.describe "Mechanics index page" do
  it "displays all mechanics" do
    mechanic_1 = Mechanic.create!(name: "Sam Mills", years_of_experience: 10)
    mechanic_2 = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_of_experience)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.years_of_experience)
  end
end
