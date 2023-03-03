class AddLatitudeToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :latitude, :decimal
  end
end
