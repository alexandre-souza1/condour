class CreateResidents < ActiveRecord::Migration[7.1]
  def change
    create_table :residents do |t|
      t.string :residence_number
      t.string :block, null: true
      t.integer :role
      t.references :condominium, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
