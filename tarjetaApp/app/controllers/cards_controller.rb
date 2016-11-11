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
    @card = Card.new(card_params)

    @card.save
    redirect_to @card
  end
end
