#spec/lost_animal.rb
require_relative '../lib/lost_animal'
describe 'user_login' do
    describe '#hello' do
      it 'should be defined' do
        expect { hello('Testing') }.not_to raise_error#::NoMethodError)
        
      end
    end
end
#I do not know it this is right, bc I am testing the API
describe 'map' do
  it 'should show the map' do
    expect {mapbox.mapview}.not_to raise_error#::NoMethodError)
  end
end

describe 'search bar map' do
  it 'should show a search bar'
  it 'should show results'
  it 'should show a json'
end

describe 'map api working' do
  it 'should call the api key' do
    obj.should_receive(finder.env)
  end
end

#read our geojson file
describe 'it should read address json' do
  context 'should have information inside the json' do
    let(:input_file) {File.read(PATH_TO_FILE)}
    subject = Address::MapboxGeocoder.new(json_file)
  end
end

describe 'it should save geojson into json file' do
  context 'show address' do 
    let(:input_file) {File.save(PATH_TO_FILE)}
    subject = Address::MapboxGeocoder.new(json_file)
  end
end

should "throw if access_token is not defined" do
  assert_raise {
    Mapbox.request()
  }
end

should "#geocode_forward" do
  result = Mapbox::Geocoder.geocode_forward("Colorado Springs , CO")
  assert result
end