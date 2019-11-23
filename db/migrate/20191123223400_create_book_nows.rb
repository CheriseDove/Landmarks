class CreateBookNows < ActiveRecord::Migration[6.0]
  def change
    create_table :book_nows do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address

      t.timestamps
    end
  end
end
