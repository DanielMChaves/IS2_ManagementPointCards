class PricesController < ApplicationController
  def new
  end

  def create
    @price = Price.new(params[:price])

    @price.save
    redirect_to @price
  end
end
