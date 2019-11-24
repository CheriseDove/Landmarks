atom_feed do |feed|
  feed.name "Who bought #{@landmark.name}"

  feed.updated @latest_book_now.try(:updated_at)

  @landmark.book_nows.each do |book_now|
    feed.entry(book_now) do |entry|
      entry.name "Order #{book_now.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Emailed to #{book_nows.email}"

        xhtml.table do
          xhtml.tr do
            xhtml.th 'Product'
            xhtml.th 'Quantity'
            xhtml.th 'Total Price'
          end #end do
          book_now.line_landmarks.each do |item|
            xhtml.tr do
              xhtml.td item.landmark.name
              xhtml.td item.quantity
              xhtml.td number_to_currency item.total_price
            end# end do
          end # end do
          xhtml.tr do
            xhtml.th 'total', colspan: 2
            xhtml.th number_to_currency book_now.line_landmarks.map(&:total_price).sum
          end #end do
        end #  end xhtml.table do

      end # end entry.summary type: 'xhtml' do |xhtml|
      entry.author do |author|
        author.name book_now.name
        author.email book_now.email
      end# end do
    end # end of feed.entry(book_now) do |entry|
  end # end of @landmark.book_nows.each do |book_now|
end #end atom
