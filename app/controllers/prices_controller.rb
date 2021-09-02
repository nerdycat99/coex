# frozen_string_literal: true

class PricesController < ApplicationController

  def create
    @price = Price.create(currency_code: 'BTHAUD', last: 123.456, bid: 121.345, ask: 100.567)
    redirect_to price_path(@price.id)
  end

  def index
    @prices = Price.all
  end

  def show
    @price = Price.find_by_id(params[:id])
  end

end