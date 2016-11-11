class CardsController < ApplicationController
  def new
  end

  def create
    @card = Card.new()

    @card.save
    redirect_to @card
  end
end
