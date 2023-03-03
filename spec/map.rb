#spec/map.rb
require 'mapbox'
require 'shoulda'
require 'test/unit'
require 'mocha'
require 'spec_helper'

should "#geocode_forward" do
  result = Mapbox::Geocoder.geocode_forward("Colorado Springs , CO")
  assert result
end

should "set_default_timeouts" do
  result = Mapbox::Geocoder.geocode_forward("Colorado Springs , CO")
  assert Mapbox.request_opts[:timeout] = 80
  assert Mapbox.request_opts[:open_timeout] = 30
end

should "set_custom_timeouts" do
  Mapbox.request_timeout = 10
  Mapbox.request_open_timeout = 5
  result = Mapbox::Geocoder.geocode_forward("Colorado Springs , CO", {:proximity => {:longitude => 38.892833823146056, :latitude => -104.80061464318779}})
  assert Mapbox.request_opts[:timeout] == 10
  assert Mapbox.request_opts[:open_timeout] == 5
end

should "#map match with just coordinates and profile" do
  Mapbox.access_token = ENV["pk.eyJ1Ijoiam9zdWV0b3JyZXNmMiIsImEiOiJjbDh3bDhvcXcwYWU2M29vYTIzeXV5c3hlIn0.KBJxuzXQCIIAU8Cg3RaRBA"]
  result = Mapbox::MapMatching.map_matching([{
    "longitude" => -117.17282,
    "latitude" => 32.71204
  }, {
    "longitude" => -117.17288,
    "latitude" => 32.71225
  }, {
    "longitude" => -117.17293,
    "latitude" => 32.71244
    },{
    "longitude" => -117.17292,
    "latitude" => 32.71256
    }], "driving")
  assert result
end

should "#directions" do
  Mapbox.access_token = ENV["pk.eyJ1Ijoiam9zdWV0b3JyZXNmMiIsImEiOiJjbDh3bDhvcXcwYWU2M29vYTIzeXV5c3hlIn0.KBJxuzXQCIIAU8Cg3RaRBA"]
  result = Mapbox::Directions.directions([
    {
      :longitude => -100,
      :latitude => 38
    },
    {
      :longitude => -90,
      :latitude => 38
    }
  ])
  assert result
end

test 'engine is loaded' do
  assert_equal ::Rails::Engine, MapboxGl::Rails::Engine.superclass
end

test 'javascript are served' do
  get '/assets/mapbox-gl.js'
  assert_mapbox_gl_js(response)
end

test 'javascript of valid version' do
  get '/assets/mapbox-gl.js'
  assert_mapbox_gl_js(response, MapboxGl::Rails::VERSION::STRING)
end

test 'stylesheets are served' do
  get '/assets/mapbox-gl.css'
  assert_mapbox_gl_css(response)
end


let(:mb) {
  Mapbox::Html.new(
      access_token: 'pk.eyJ1Ijoiam9zdWV0b3JyZXNmMiIsImEiOiJjbDh3bDhvcXcwYWU2M29vYTIzeXV5c3hlIn0.KBJxuzXQCIIAU8Cg3RaRBA',
      mapid: Mapbox::ID_STREETS
  )
}

describe '#base_url' do
  it 'with map_option' do
    mb.map_option = 'geocoder'
    expect(mb.base_url).to eq('http://api.tiles.mapbox.com/v4/mapbox.streets/geocoder.html')
  end

  it 'without map_option' do
    expect(mb.base_url).to eq('http://api.tiles.mapbox.com/v4/mapbox.streets.html')
  end
end

describe '#get' do
  it 'http response 200' do
    expect(mb.get.status).to eq(200)
  end
end

describe '#response' do
  it 'get html' do
    expect(mb.response).to start_with('<!DOCTYPE html>')
  end
end

describe 'access toke' do
    it 'forward geocoding url' do
        expect(mg.base_url).to eq('http://api.tiles.mapbox.com/v4/geocode/mapbox.places/1%20ocean%20drive%20miami%20beach.json')
    end
end

describe '#get' do

    mg = Mapbox::Geocode.new(
        access_token: 'pk.eyJ1Ijoiam9zdWV0b3JyZXNmMiIsImEiOiJjbDh3bDhvcXcwYWU2M29vYTIzeXV5c3hlIn0.KBJxuzXQCIIAU8Cg3RaRBA',
        query: '1 ocean drive miami beach',
    )

    it 'forward geocoding http request' do
      expect(mg.get).to eq({"type"=>"FeatureCollection", "query"=>["1", "ocean", "drive", "miami", "beach"],
                            "features"=>[{"id"=>"address.3803477900", "type"=>"Feature", "text"=>"Ocean Dr",
                                          "place_name"=>"1 Ocean Dr, Miami, 33139, Florida, United States",
                                          "relevance"=>0.8, "center"=>[-80.13245, 25.768924],
                                          "geometry"=>{"type"=>"Point", "coordinates"=>[-80.13245, 25.768924]},
                                          "bbox"=>[-80.13356099999999, 25.768513999999993,
                                                   -80.12883499999998, 25.788005999999992],
                                          "address"=>"1", "properties"=>{},
                                          "context"=>[{"id"=>"place.3389175508", "text"=>"Miami"},
                                                      {"id"=>"postcode.260297597", "text"=>"33139"},
                                                      {"id"=>"region.3998021366", "text"=>"Florida"},
                                                      {"id"=>"country.4150104525", "text"=>"United States"}]}],
                            "attribution"=>"NOTICE: You may cache this data for up to 30 days. © 2015 Mapbox and its suppliers. All rights reserved. Use of this data is subject to the Mapbox Terms of Service. (https://www.mapbox.com/about/maps/)"})
    end
end

describe '#base_url' do

    mg = Mapbox::Geocode.new(
        access_token: 'pk.eyJ1Ijoiam9zdWV0b3JyZXNmMiIsImEiOiJjbDh3bDhvcXcwYWU2M29vYTIzeXV5c3hlIn0.KBJxuzXQCIIAU8Cg3RaRBA',
        lat: '25.768924',
        lon: '-80.13245',
    )

    it 'reverse geocoding url' do
        expect(mg.base_url).to eq('http://api.tiles.mapbox.com/v4/geocode/mapbox.places/-80.13245,25.768924.json')
    end
end