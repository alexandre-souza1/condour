class RenameColumnDescripitionInTableServices < ActiveRecord::Migration[7.1]
  def change
    rename_column :services, :type, :description
  end
end
