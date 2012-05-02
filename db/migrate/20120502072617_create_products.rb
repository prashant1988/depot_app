class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :describe
      t.string :image_url
      t.decimal :price, :price, :precision=> 8, :scale=> 2

      t.timestamps
    end
  end
end
