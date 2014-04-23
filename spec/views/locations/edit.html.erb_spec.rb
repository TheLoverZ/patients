require 'spec_helper'

describe "locations/edit" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :code => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do
      assert_select "input#location_code[name=?]", "location[code]"
      assert_select "input#location_name[name=?]", "location[name]"
    end
  end
end
