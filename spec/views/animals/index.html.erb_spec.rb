require 'rails_helper'

RSpec.describe "animals/index", type: :view do
  before(:each) do
    assign(:animals, [
      Animal.create!(
        breed: "Breed",
        size: "Size",
        color: "Color",
        lost: false,
        found: false
      ),
      Animal.create!(
        breed: "Breed",
        size: "Size",
        color: "Color",
        lost: false,
        found: false
      )
    ])
  end

  it "renders a list of animals" do
    render
    assert_select "tr>td", text: "Breed".to_s, count: 2
    assert_select "tr>td", text: "Size".to_s, count: 2
    assert_select "tr>td", text: "Color".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
