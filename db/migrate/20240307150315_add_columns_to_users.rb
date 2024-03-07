class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :residence_number, :integer
    add_column :users, :block, :string
    add_column :users, :role, :string
    add_reference :users, :condominium, null: false, foreign_key: true
  end
end
