class CardsController < ApplicationController
  def index
    if params[:client_id]
      @cards = Card.where(client_id: params[:client_id])
    else
      @cards = Card.all
    end
  end

  def show
    if params[:client_id]
      @card = Card.where(client_id: params[:client_id]).find(params[:id])
    else
      @card = Card.find(params[:id])
    end
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @client = Client.find(params[:client_id])
    @card = @client.cards.create()
    redirect_to client_path(@client)
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_edit_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    redirect_to @card
  end

  private
  def card_edit_params
    params.require(:card).permit(:id, :points, :status)
  end
end
