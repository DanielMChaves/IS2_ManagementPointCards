class PricesController < ApplicationController
  def new
  end

  def create
    @price = Price.new(
      params.require(:price).permit(:title, :text)
    )

    @price.save
    redirect_to @price
  end
end
