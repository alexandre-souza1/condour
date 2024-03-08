class ChangeColumnToUsers1 < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :condominium_id, true
  end
end
