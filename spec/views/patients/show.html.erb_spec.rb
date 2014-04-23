require 'spec_helper'

describe "patients/show" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :first_name => "First",
      :middle_name => "Middle",
      :last_name => "Last",
      :birthday => Date.today,
      :gender => "male",
      :status => "initial",
      :location_id => 2,
      :view_count => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Initial/)
    expect(rendered).to match(/Test Location 2/)
    expect(rendered).to match(/View Count/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Birthday/)
    expect(rendered).to match(/Medical Number/)
    expect(rendered).to match(/Edit/)
    expect(rendered).to match(/Back/)
  end
end
