class AddUserIdToRules < ActiveRecord::Migration[7.1]
  def change
    add_column :rules, :user_id, :integer
  end
end
