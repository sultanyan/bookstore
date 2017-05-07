class BooksController < ApplicationController

  before_action :find_params, only:[:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order('id desc')
    @categories = Category.all
  end

  def show
    @categories = Category.all
  end

  def new
    @pageTitle = "Add New Book"
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book added successfully"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "The book updated successfully!"
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    if @book.delete
      flash[:notice] = "The book deleted successfully!"
      redirect_to root_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :year, :price, :buy, :excerpt, :format, :pages, :coverpath)
  end

  def find_params
    @book = Book.find(params[:id])
  end
end
