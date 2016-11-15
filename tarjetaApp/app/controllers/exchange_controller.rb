class ExchangesController < ApplicationController
  def index
    @exchange = Exchange.all
  end

  def show
    @exchange = Exchange.find(params[:id])
  end

  def new
    @exchange = Exchange.new
  end

  def edit
    @exchange = Exchange.find(params[:id])
  end

  def create
    @exchange = Exchange.new(exchange_params)

    if @exchange.save
      redirect_to @exchange
    else
      render 'new'
    end
  end

  def update
    @exchange = Exchange.find(params[:id])

    if @exchange.update(exchange_params)
      redirect_to @exchange
    else
      render 'edit'
    end
  end

  def destroy
    @exchange = Exchange.find(params[:id])
    @exchange.destroy

    redirect_to @exchange
  end

  private
  def exchange_params
    params.require(:exchange).permit(:card_id, :price_id, :exchange_date)
  end

end
