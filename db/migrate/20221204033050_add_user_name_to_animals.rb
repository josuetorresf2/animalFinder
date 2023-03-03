class AddUserNameToAnimals < ActiveRecord::Migration[7.0]
  def change
    add_column :animals, :user_name, :string
    add_index :animals, :user_name
  end
end
