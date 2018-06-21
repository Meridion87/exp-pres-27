class ProductsController < ApplicationController
  def create
    @product = Product.new(products_params)
    category = Category.find(params[:category_id])
    @product.category = category

    @product.save
    redirect_to category

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to show_path

  end


  private
  def products_params
    params.require(:product).permit(:name, :price)
  end
end
