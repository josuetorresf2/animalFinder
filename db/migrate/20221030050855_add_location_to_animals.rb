class AddLocationToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :location, :string
  end
end
