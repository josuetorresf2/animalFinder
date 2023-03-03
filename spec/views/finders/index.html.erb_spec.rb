require 'rails_helper'

RSpec.describe "finders/index", type: :view do
  before(:each) do
    assign(:finders, [
      Finder.create!(
        name: "Name",
        latitude: 2.5,
        longitude: 3.5
      ),
      Finder.create!(
        name: "Name",
        latitude: 2.5,
        longitude: 3.5
      )
    ])
  end

  it "renders a list of finders" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
  end
end
