require 'spec_helper'

describe "patients/index" do
  before(:each) do
    assign(:patients, [
      stub_model(Patient,
        :first_name => "First",
        :middle_name => "Middle",
        :last_name => "Last",
        :birthday => Date.today,
        :gender => "male",
        :status => "initial",
        :location_id => 2,
        :view_count => 3
      ),
      stub_model(Patient,
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :birthday => Date.today,
        :gender => "male",
        :status => "initial",
        :location_id => 2,
        :view_count => 3
      )
    ])
  end

  it "renders a list of patients" do
    render
    expect(rendered).to match /Full Name/
    expect(rendered).to match /Last, First Middle/
    expect(rendered).to match /Ages/
    expect(rendered).to match /Gender/
    expect(rendered).to match /Male/
    expect(rendered).to match /Status/
    expect(rendered).to match /Initial/
    expect(rendered).to match /Location/
    expect(rendered).to match /Test Location 2/
    expect(rendered).to match /View Count/
    expect(rendered).to match /3/
    expect(rendered).to match /Show/
    expect(rendered).to match /Edit/
    expect(rendered).to match /Destroy/
  end
end
