# frozen_string_literal: true

class PricesController < ApplicationController

  def create
    currency_collection = CurrencyServices::RetrieveCurrency.new(['BTCAUD','ETHAUD']).call
    currency_collection.map { |c| Price.create(c) }
    redirect_to root_path
  end

  def index
    @prices = Price.all
  end

end