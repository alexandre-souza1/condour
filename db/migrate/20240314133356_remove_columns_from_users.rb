class RemoveColumnsFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :residence_number, :integer
    remove_column :users, :block, :string
    remove_column :users, :role, :string
    remove_reference :users, :condominium, null: false, foreign_key: true
  end
end
