class BookNowsController < ApplicationController
  include CurrentList
  before_action :set_list, only: [:new, :create]
  before_action :ensure_list_isnt_empty, only: :new
  before_action :set_book_now, only: [:show, :edit, :update, :destroy]

  # GET /book_nows
  # GET /book_nows.json
  def index
    @book_nows = BookNow.all
  end

  # GET /book_nows/1
  # GET /book_nows/1.json
  def show
  end

  # GET /book_nows/new
  def new
    @book_now = BookNow.new
  end

  # GET /book_nows/1/edit
  def edit
  end

  # POST /book_nows
  # POST /book_nows.json
  def create
    @book_now = BookNow.new(book_now_params)
    @book_now.add_line_landmarks_from_list(@list)

    respond_to do |format|
      if @book_now.save
        List.destroy(session[:list_id])
        session[:list_id] = nil

        format.html {
          redirect_to attractions_url, notice: 'Thank you for Booking. You will recieve your details via email in a few moments.'
        }
        format.json { render :show, status: :created, location: @book_now }
      else
        format.html { render :new }
        format.json { render json: @book_now.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_nows/1
  # PATCH/PUT /book_nows/1.json
  def update
    respond_to do |format|
      if @book_now.update(book_now_params)
        format.html { redirect_to @book_now, notice: 'Book now was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_now }
      else
        format.html { render :edit }
        format.json { render json: @book_now.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_nows/1
  # DELETE /book_nows/1.json
  def destroy
    @book_now.destroy
    respond_to do |format|
      format.html { redirect_to book_nows_url, notice: 'Book now was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def ensure_list_isnt_empty
  if @list.line_landmarks.empty?
    redirect_to attractions_url, notice: "You have nothing in your list"
  end
end
    # Use callbacks to share common setup or constraints between actions.
    def set_book_now
      @book_now = BookNow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_now_params
      params.require(:book_now).permit(:name, :email, :phone, :address)
    end
end
