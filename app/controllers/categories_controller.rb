class CategoriesController < ApplicationController
  skip_before_action :authorize

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
    flash[:notice] = "Category successfully created =)"
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
    flash[:notice] = "Category was successfully updated =)"
    redirect_to categories_path
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Category was successfully deleted =)"
    redirect_to categories_path
  end

  def show
    @category = Category.find(params[:id])
  end

  def catalog
    @categories = Category.where(params[:id])
  end

  private
    def category_params
      params.require(:category).permit(:title, :description, :product_ids => [])
    end

end
