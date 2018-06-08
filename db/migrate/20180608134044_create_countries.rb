class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :bounds

      t.timestamps
    end
  end
end
