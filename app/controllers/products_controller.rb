class ProductsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: ProductsDataTable.new(view_context) }
    end
  end

  def show
    @product = Product.find params[:id]
  end

end
