class CreateFinders < ActiveRecord::Migration[5.2]
  def change
    create_table :finders do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
