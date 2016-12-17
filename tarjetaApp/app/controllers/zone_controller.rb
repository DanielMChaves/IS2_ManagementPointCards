class ZoneController < ApplicationController
  def index
  end

  # Catalogue of all prices
  def catalogue
    @client = Client.find(params[:id])
    @prices = Price.where('lot > 0')
  end

  # List of cards
  def profile
    @client = Client.find(params[:id])
    @cards = @client.cards
  end

  # One price info
  def price
    @client = Client.find(params[:id])
    @price = Price.find(params[:price_id])
    @cards = @client.cards.where('points >= ?', @price.requirement)
  end

  # Perform the exchange
  def exchange
    @client = Client.find(params[:client_id])
    @price = Price.find(params[:price_id])
    @card = Card.find(params[:card_id])

    @exchange = Exchange.create(
      price_id: @price.id,
      card_id: @card.id,
      exchange_date: Time.now
    )
    @card.points = @card.points - @price.requirement
    @price.lot = @price.lot - 1

    @exchange.save
    @card.save
    @price.save

    redirect_to action: 'catalogue', id: @client.id
  end
end
