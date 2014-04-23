require 'spec_helper'

describe "patients/edit" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :first_name => "First",
      :middle_name => "Middle",
      :last_name => "Last",
      :birthday => Date.today,
      :gender => "male",
      :status => "initial",
      :location_id => 1,
      :view_count => 1
    ))
  end

  it "renders the edit patient form" do
    render

    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Initial/)
    expect(rendered).to match(/Test Location 2/)
    expect(rendered).not_to match(/View Count/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Birthday/)
    expect(rendered).not_to match(/Medical Number/)
    expect(rendered).to match(/Edit/)
    expect(rendered).to match(/Back/)
  end
end
