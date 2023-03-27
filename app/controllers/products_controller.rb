class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "商品を新規登録しました"
      redirect_to products_path
    elsif params[:back]
      render :new
    else
      render :index
    end
    # render :new and return if params[:back]
  end
  def confirm
    @product = Product.new(product_params)
    if @product.invalid?
      flash.now[:notice] = "入力内容にエラーがあります"
      render :new
      return
    end
  end
  private
    def product_params
      params.require(:product).permit(:order_date, :product_name, :product_price, :product_quantity, :product_type)
    end
end
