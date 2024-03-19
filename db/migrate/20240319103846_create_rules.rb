class CreateRules < ActiveRecord::Migration[7.1]
  def change
    create_table :rules do |t|
      t.string :title
      t.text :content
      t.references :condominium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
