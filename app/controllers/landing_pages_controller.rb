# frozen_string_literal: true

class LandingPagesController < ApplicationController

  def index
    @btc = Price.where(currency_code: "BTCAUD").last
    @eth = Price.where(currency_code: "ETHAUD").last
  end

end