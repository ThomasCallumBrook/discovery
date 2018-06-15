class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.references :user, foreign_key: true
      t.string :name, null: false
      t.string :bounds, null: false

      t.timestamps
    end
  end
end
