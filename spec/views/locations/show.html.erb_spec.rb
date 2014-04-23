require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :code => "Code",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    @patients = @location.patients
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/All Patients Under This Location/)
    expect(rendered).to match(/Medical Number/)
    expect(rendered).to match(/Ages/)
    expect(rendered).to match(/Gender/)
  end
end
