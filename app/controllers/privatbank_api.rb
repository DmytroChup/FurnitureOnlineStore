# frozen_string_literal: true

require "net/http"
require "uri"
require "json"

class PrivatbankApi
  API_URL = URI("https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=5")

  def self.fetch_currency_rates
    response = Net::HTTP.get(API_URL)
    JSON.parse(response)
  end
end
