class AddNumberBlockColumnToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :residence_number, :string
    add_column :places, :block, :string
  end
end
