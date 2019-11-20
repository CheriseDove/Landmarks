class CreateLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :landmarks do |t|
      t.string :image_url
      t.string :name
      t.string :location
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
