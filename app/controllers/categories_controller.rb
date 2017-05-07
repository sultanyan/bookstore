class CategoriesController < ApplicationController

  before_action :find_category, only:[:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
    @books = @category.books # Will bring in all books from that specific category
  end

  def new
    @pageTitle = "Add New Category"
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category added successfully!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category updated successfully!"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    if @category.delete
      flash[:notice] = "Category deleted successfully!"
      redirect_to categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
