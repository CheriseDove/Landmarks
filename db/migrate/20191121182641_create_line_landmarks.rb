class CreateLineLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :line_landmarks do |t|
      t.references :landmark, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
