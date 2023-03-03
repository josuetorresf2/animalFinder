class CreateAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :species, :string
    create_table :animals do |t|
      t.string :breed
      t.string :size
      t.string :color
      t.boolean :lost
      t.boolean :found
      t.timestamps
    end
  end
end
