require 'rails_helper'

RSpec.describe "animals/new", type: :view do
  before(:each) do
    assign(:animal, Animal.new(
      breed: "MyString",
      size: "MyString",
      color: "MyString",
      lost: false,
      found: false
    ))
  end

  it "renders new animal form" do
    render

    assert_select "form[action=?][method=?]", animals_path, "post" do

      assert_select "input[name=?]", "animal[breed]"

      assert_select "input[name=?]", "animal[size]"

      assert_select "input[name=?]", "animal[color]"

      assert_select "input[name=?]", "animal[lost]"

      assert_select "input[name=?]", "animal[found]"
    end
  end
end
