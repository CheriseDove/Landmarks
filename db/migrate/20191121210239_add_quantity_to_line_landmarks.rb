class AddQuantityToLineLandmarks < ActiveRecord::Migration[6.0]
  def change
    add_column :line_landmarks, :quantity, :integer, default: 1
  end
end
