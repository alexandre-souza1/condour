class DropRulesTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :rules
  end
end
