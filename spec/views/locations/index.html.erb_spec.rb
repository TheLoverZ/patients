require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :code => "Code",
        :name => "Name"
      ),
      stub_model(Location,
        :code => "Code",
        :name => "Name"
      )
    ])
  end

  it "renders a list of locations" do
    render

    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Show/)
    expect(rendered).to match(/Edit/)
    expect(rendered).to match(/Destroy/)
    expect(rendered).to match(/New Location/)
  end
end
