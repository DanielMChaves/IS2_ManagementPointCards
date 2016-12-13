class ZoneController < ApplicationController
  def index
  end

  def catalogue
    @prices = Price.all
  end
  def profile
    @client = Client.find(params[:id])
    @cards = @client.cards
  end

  def price
    @client = Client.find(params[:id])
    @price = Price.find(params[:price_id])
  end

  def exchange
    @price = Price.find(params[:price_id])
    @client = Client.find(params[:id])
    @cards = @client.cards
  end
end
