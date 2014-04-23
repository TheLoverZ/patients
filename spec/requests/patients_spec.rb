require 'spec_helper'

describe "Patients" do
  describe "GET /patients" do
    it "works! (now write some real specs)" do
      get patients_path
      expect(response.status).to be(200)
    end
  end

  it "can correctly add & edit & show & delete patient" do
    Patient.destroy_all
    # add
    visit "/"
    expect(page).to have_content("All Patients")
    click_link "New Patient"
    expect(page).to have_content("New Patient")
    # fill in informations
    fill_in "patient_first_name", :with => "Foo"
    fill_in "patient_last_name", :with => "Bar"
    select '1991', :from => 'patient_birthday_1i'
    choose 'patient_gender_male'
    click_button 'Create Patient'
    expect(page).to have_content("Medical Number")
    expect(page).to have_content("Edit")
    expect(page).to have_content("Back")
    click_link "Back"
    expect(page).to have_content("Bar, Foo")
    expect(page).to have_content("Test Location 1")
    # edit
    click_link "Edit"
    expect(page).to have_content("Edit Patient")
    fill_in "patient_first_name", :with => "Wow"
    choose 'patient_gender_male'
    click_button "Update Patient"
    expect(page).to have_content("First Name")
    expect(page).to have_content("Wow")
    visit "/"
    expect(page).to have_content("Bar, Wow")
    # show
    click_link "Show"
    expect(page).to have_content("First Name")
    expect(page).to have_content("Wow")
    expect(page).to have_content("2")
    # delete
    visit "/"
    click_link "Destroy"
    expect(page).not_to have_content("Bar, Wow")
  end
end
