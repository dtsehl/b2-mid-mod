require 'rails_helper'

RSpec.describe "Mechanics index page" do
  it "displays all mechanics" do
    visit "/mechanics"

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.years_of_experience)
    expect(page).to have_content(mechanic_2.name)
    expect(page).to have_content(mechanic_2.years_of_experience)
  end
end
