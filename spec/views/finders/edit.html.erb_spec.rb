require 'rails_helper'

RSpec.describe "finders/edit", type: :view do
  before(:each) do
    @finder = assign(:finder, Finder.create!(
      name: "MyString",
      latitude: 1.5,
      longitude: 1.5
    ))
  end

  it "renders the edit finder form" do
    render

    assert_select "form[action=?][method=?]", finder_path(@finder), "post" do

      assert_select "input[name=?]", "finder[name]"

      assert_select "input[name=?]", "finder[latitude]"

      assert_select "input[name=?]", "finder[longitude]"
    end
  end
end
