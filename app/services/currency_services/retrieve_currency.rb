# frozen_string_literal: true

module CurrencyServices
  class RetrieveCurrency
    require 'net/http'
    require 'uri'

    attr_accessor :currencies

    def initialize(currencies)
      @currencies = currencies
    end

    def call
      currency_collection = []
      currencies.each do | currency |
        json_response = JSON.parse(retrieve_data(currency))
        puts json_response.inspect
        currency_data = {
          "currency_code" => "#{currency}",
          "ask" => "#{json_response.dig("ask")}",
          "bid" => "#{json_response.dig("bid")}",
          "last" => "#{json_response.dig("last")}"
        }
        currency_collection << currency_data
      end
      currency_collection
    end

    def retrieve_data(currency)
      uri = URI.parse("https://data.exchange.coinjar.com/products/#{currency}/ticker")
      response = Net::HTTP.get_response(uri)
      response.body
    end
  end
end