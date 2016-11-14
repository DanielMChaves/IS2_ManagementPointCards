class PricesController < ApplicationController
  def index
    @prices = Price.all
  end

  def show
    @price = Price.find(params[:id])
  end

  def new
    @price = Price.new
  end

  def edit
    @price = Price.find(params[:id])
  end

  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to @price
    else
      render 'new'
    end
  end

  def update
    @price = Price.find(params[:id])

    if @price.update(price_params)
      redirect_to @price
    else
      render 'edit'
    end
  end

  def destroy
    @price = Price.find(params[:id])
    @price.destroy

    redirect_to @price
  end

  private
  def price_params
    params.require(:price).permit(:status, :requirement, :lot, :concept)
  end

end
