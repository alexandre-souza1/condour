class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name
      t.float :price
      t.string :description
      t.references :condominium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
