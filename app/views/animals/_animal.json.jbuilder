json.extract! animal, :id, :species, :breed, :size, :color, :longitude, :latitude, :location, :lost, :found, :created_at, :updated_at
json.url animal_url(animal, format: :json)
