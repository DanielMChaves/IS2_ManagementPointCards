class PricesController < ApplicationController
  def new
  end

  def create
    render plain: params[:price].inspect
  end
end
