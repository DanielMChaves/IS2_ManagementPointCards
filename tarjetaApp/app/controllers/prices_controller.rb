class PricesController < ApplicationController
  def new
  end

  def create
    @price = Price.new(price_params)

    @price.save
    redirect_to @price
  end

  private
  def price_params
    params.require(:price).permit(:title, :text)
  end
end
