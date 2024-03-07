class CreateCondominia < ActiveRecord::Migration[7.1]
  def change
    create_table :condominia do |t|
      t.string :name
      t.string :address
      t.integer :cnpj

      t.timestamps
    end
  end
end
