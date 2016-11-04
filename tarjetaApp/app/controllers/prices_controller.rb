class PricesController < ApplicationController
  def index
    @prices = Price.all
  end

  def show
    @price = Price.find(params[:id])
  end

  def new
  end

  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to @price
    else
      render 'new'
    end
  end

  private
  def price_params
    params.require(:price).permit(:title, :text)
  end
end
