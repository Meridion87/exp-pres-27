class ProductsController < ApplicationController
  def create
    @product = Product.new(products_params)
    category = Category.find(params[:category_id])
    @product.category = category

    @product.save
    redirect_to category
    # redirect_to product.category
    # redirect_to category_path (id: product.category.id)

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to @product.category #redirecciona a la categorìa del producto borrado

  end


  private
  def products_params
    params.require(:product).permit(:name, :price, :category_id)
  end
end
