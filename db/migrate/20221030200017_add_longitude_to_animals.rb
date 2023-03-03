class AddLongitudeToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :longitude, :decimal
  end
end
