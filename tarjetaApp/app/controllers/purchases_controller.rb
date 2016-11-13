class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def create
    @card = Card.find(params[:card_id])
    @purchase = @card.purchases.create

    if @purchase.save
      redirect_to cards_path(@card)
    else
      render 'new'
    end
  end

  def update
    @purchase = Purchase.find(params[:id])

    if @purchase.update(purchase_params)
      redirect_to @purchase
    else
      render 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy

    redirect_to @purchase
  end

  private
  def purchase_params
    params.require(:purchase).permit(:id_store, :buy_date, :total, :card_id)
  end
end
