class AddCondominiumIdToRules < ActiveRecord::Migration[7.1]
  def change
    add_column :rules, :condominium_id, :integer
  end
end
