require 'rails_helper'

RSpec.describe "animals/show", type: :view do
  before(:each) do
    @animal = assign(:animal, Animal.create!(
      breed: "Breed",
      size: "Size",
      color: "Color",
      lost: false,
      found: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Breed/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
