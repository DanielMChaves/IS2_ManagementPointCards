class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def show
    @purchases = Purchase.find(params[:id])
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      Card.set_points(@purchase.card_id, 1)
      redirect_to purchases_path
    else
      render 'new'
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(:id_store, :buy_date, :total, :card_id)
  end
end
