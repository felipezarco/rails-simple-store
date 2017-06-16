class ProductsController < ApplicationController

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      Product.create(product_params)
      flash[:notice] = "Product successfully created =)"
      redirect_to products_path
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      @product.update_attributes(product_params)
      flash[:notice] = "Product was successfully updated =)"
      redirect_to products_path
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      flash[:notice] = "Product was successfully deleted =)"
      redirect_to products_path
    end

    private
      def product_params
        params.require(:product).permit(:title, :image_url, :description, :price, :category_ids => [])
      end
end
