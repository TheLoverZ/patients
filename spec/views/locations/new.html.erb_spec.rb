require 'spec_helper'

describe "locations/new" do
  before(:each) do
    assign(:location, stub_model(Location,
      :code => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do
      assert_select "input#location_code[name=?]", "location[code]"
      assert_select "input#location_name[name=?]", "location[name]"
    end
  end
end
