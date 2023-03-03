require 'rails_helper'

RSpec.describe "finders/new", type: :view do
  before(:each) do
    assign(:finder, Finder.new(
      name: "MyString",
      latitude: 1.5,
      longitude: 1.5
    ))
  end

  it "renders new finder form" do
    render

    assert_select "form[action=?][method=?]", finders_path, "post" do

      assert_select "input[name=?]", "finder[name]"

      assert_select "input[name=?]", "finder[latitude]"

      assert_select "input[name=?]", "finder[longitude]"
    end
  end
end
