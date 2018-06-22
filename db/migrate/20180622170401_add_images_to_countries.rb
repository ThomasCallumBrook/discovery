class AddImagesToCountries < ActiveRecord::Migration[5.1]
  def change
    add_column :countries, :images, :json
  end
end
