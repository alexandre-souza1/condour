class ChangePriceColumnToPlaces < ActiveRecord::Migration[7.1]
  def change
    rename_column :places, :price, :rent_price
    add_column :places, :sale_price, :float
    add_column :places, :contact, :string
  end
end
