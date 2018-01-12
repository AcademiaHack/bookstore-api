class Api::V1::BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  before_action :set_author, only: [:index, :show, :create, :update, :destroy]

  # GET /books
  def index
    @books = @author.books.all
    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = @author.books.new(book_params)

    if @book.save
      render json: @book, status: :created, location: api_v1_author_books_path(@author)
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def set_author
      @author = Author.find(params[:author_id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:author_id, :title, :price)
    end
end