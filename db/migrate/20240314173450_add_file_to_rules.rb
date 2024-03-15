class AddFileToRules < ActiveRecord::Migration[7.1]
  def change
    add_column :rules, :file, :binary
  end
end
