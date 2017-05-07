class AuthorsController < ApplicationController
  before_action :find_author, only: [:edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @pageTitle = "Add Author"
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "New author added successfully"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:notice] = "Author updated successfully"
      redirect_to authors_path
    else
      render 'edit'
    end
  end

  def destroy
    if @author.delete
      flash[:notice] = "Author deleted successfully!"
      redirect_to authors_path
    end
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end

  def find_author
    @author = Author.find(params[:id])
  end
end
