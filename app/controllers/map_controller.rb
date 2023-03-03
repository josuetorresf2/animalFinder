class MapController < ApplicationController
    def map
        @animals = Animal.all
        @geojson = Array.new
  
        @animals.each do |animal|
  
          @geojson << {
            type: "Feature",
            geometry: {
            type: "Point",
            coordinates: [animal.longitude, animal.latitude] # this part is tricky
        },
        properties: {
          breed: animal.breed,
          color: animal.color,
          size: animal.size,
          location: animal.location,
          lost: animal.lost,
          found: animal.found,
          :"marker-color" => "#FFFFFF",
          :"marker-symbol" => "circle",
          :"marker-size" => "medium",
        }
      }
        end
  
        respond_to do |format|
          format.html
          format.json { render json: @geojson }  # respond with the created JSON object
        end
    end

end
