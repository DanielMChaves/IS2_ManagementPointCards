class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
  end

  def new
  end

  def create
    @card = Card.new()

    @card.save
    redirect_to @card
  end
end
