class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(params.require(:product).permit(:order_date, :product_name, :product_price, :product_quantity, :product_type))
    # if @product.save
    #   flash[:notice] = "商品を新規登録しました"
    #   redirect_to products_path
    # else
    #   render :index
    # end
    render :new and return if params[:back]
  end
  def confirm
  end
end
