class CardsController < ApplicationController
  def index
    @cards = Card.all 
  end
  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @client = Client.find(params[:client_id])
    @card = @client.cards.create()
    redirect_to client_path(@client)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to @card
  end
end
