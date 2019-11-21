class CreateLineLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :line_landmarks do |t|
      t.references :landmark, null: false, foreign_key: true
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
