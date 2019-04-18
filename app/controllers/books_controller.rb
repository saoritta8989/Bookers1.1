class BooksController < ApplicationController

  def create
  	book = Book.new(post_params)
  	book.save
  	flash[:notice] = "Book was succesfully"
    redirect_to book_path(book.id)
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(post_params)
  	redirect_to book_path(book.id), notice: "Book was succesfully"
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_index_path
  end

  private

  def post_params
  	 params.require(:book).permit(:title, :body)
  end
end
