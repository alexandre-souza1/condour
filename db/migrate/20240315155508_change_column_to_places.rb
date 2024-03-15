class ChangeColumnToPlaces < ActiveRecord::Migration[7.1]
  def change
    rename_column :places, :apartament, :apartment
  end
end
