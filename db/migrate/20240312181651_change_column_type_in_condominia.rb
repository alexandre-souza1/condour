class ChangeColumnTypeInCondominia < ActiveRecord::Migration[7.1]
  def change
    change_column :condominia, :cnpj, :string
  end
end
