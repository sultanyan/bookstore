class PublishersController < ApplicationController
  before_action :find_publisher, only:[:edit, :update, :destroy]
  def index
    @publishers = Publisher.all
  end

  def show
  end

  def new
    @pageTitle = "Add New Publisher"
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "New publisher added successfully."
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      flash[:notice] = "Publisher updated successfully!"
      redirect_to publishers_path
    else
      render 'edit'
    end
  end

  def destroy
    if @publisher.delete
      flash[:notice] = "Publisher deleted successfully!"
      redirect_to publishers_path
    end
  end

  private
  def publisher_params
    params.require(:publisher).permit(:first_name, :last_name)
  end

  def find_publisher
    @publisher = Publisher.find(params[:id])
  end
end
