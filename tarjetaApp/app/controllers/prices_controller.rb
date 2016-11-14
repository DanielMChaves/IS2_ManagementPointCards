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
    render 'new'
  end

  def update
    @price = Price.find(params[:id])

    if @price.update(purchase_params)
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
  def purchase_params
    params.require(:price).permit(:id, :store_id, :buy_date, :total, :card)
  end

end
