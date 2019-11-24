class AdminController < ApplicationController
  def index
    @book_now=BookNow.last
    @total_book_nows = BookNow.count
  end
end
