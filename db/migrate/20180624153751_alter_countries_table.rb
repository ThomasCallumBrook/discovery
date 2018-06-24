class AlterCountriesTable < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :boundaries, :json
    remove_column :countries, :bounds
  end
end
