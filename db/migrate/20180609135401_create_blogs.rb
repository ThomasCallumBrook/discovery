class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.references :country, foreign_key: true
      t.string :title, null: false
      t.text :post, null: false

      t.timestamps
    end
  end
end
