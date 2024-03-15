class AddColumnToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_column :places, :apartament, :boolean, default: false
  end
end
