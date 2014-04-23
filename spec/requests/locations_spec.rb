require 'spec_helper'

describe "Locations" do
  describe "GET /locations" do
    it "works! (now write some real specs)" do
      get locations_path
      expect(response.status).to be(200)
    end
  end

  it "can correctly add & edit & show & delete location" do
    Location.destroy_all
    # add
    visit "/locations"
    expect(page).to have_content("List All Locations")
    click_link "New Location"
    expect(page).to have_content("New location")
    fill_in "location_code", :with => "1000000"
    fill_in "location_name", :with => "foo-bar"
    click_button "Create Location"
    expect(page).to have_content("All Patients Under This Location")
    click_link "Back"
    expect(page).to have_content("List All Locations")
    expect(page).to have_content("foo-bar")
    # edit
    click_link "Edit"
    fill_in "location_name", :with => "bar-foo"
    click_button "Update Location"
    expect(page).to have_content("All Patients Under This Location")
    click_link "Back"
    expect(page).to have_content("bar-foo")
    # show
    click_link "Show"
    expect(page).to have_content("All Patients Under This Location")
    # delete
    visit "/locations"
    click_link "Destroy"
    expect(page).not_to have_content("bar-foo")
  end
end
