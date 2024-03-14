class AddUserToCondominium < ActiveRecord::Migration[7.1]
  def change
    add_reference :condominia, :user, null: false, foreign_key: true
  end
end
