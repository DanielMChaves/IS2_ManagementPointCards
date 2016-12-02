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
    @purchase = @card.purchases.create(purchase_params)

    if @purchase.save
      @card.increase_points(@purchase.total)
      redirect_to card_path(@card)
    else
      render 'new'
    end
  end

  def update
    @purchase = Purchase.find(params[:id])
    @purchase.card.decrease_points(@purchase.total)

    if @purchase.update(purchase_params)
      @purchase.card.increase_points(@purchase.total)
      redirect_to @purchase
    else
      render 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.card.decrease_points(@purchase.total)
    @purchase.destroy

    redirect_to @purchase.card
  end

  private
  def purchase_params
    params.require(:purchase).permit(:id_store, :buy_date, :total, :card_id)
  end
end
