require 'rails_helper'

RSpec.describe "animals/edit", type: :view do
  before(:each) do
    @animal = assign(:animal, Animal.create!(
      breed: "MyString",
      size: "MyString",
      color: "MyString",
      lost: false,
      found: false
    ))
  end

  it "renders the edit animal form" do
    render

    assert_select "form[action=?][method=?]", animal_path(@animal), "post" do

      assert_select "input[name=?]", "animal[breed]"

      assert_select "input[name=?]", "animal[size]"

      assert_select "input[name=?]", "animal[color]"

      assert_select "input[name=?]", "animal[lost]"

      assert_select "input[name=?]", "animal[found]"
    end
  end
end
