require 'spec_helper'
require 'selenium-webdriver'

describe 'Google homepage test', js: true do
  before(:each) do
    visit('https://google.com')
  end

  describe "First test" do
    it "check title" do
      expect(page.title).to be == "some text"
    end
  end
end
