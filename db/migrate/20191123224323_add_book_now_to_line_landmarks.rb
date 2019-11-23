class AddBookNowToLineLandmarks < ActiveRecord::Migration[6.0]
  def change
    add_reference :line_landmarks, :book_now, foreign_key: true
  end
end
