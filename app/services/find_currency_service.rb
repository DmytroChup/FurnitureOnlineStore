# frozen_string_literal: true

class FindCurrencyService
  def call
    @currency_rates = PrivatbankApi.fetch_currency_rates
    @currency_rates.each do |rate|
      case rate["ccy"]
      when "USD"
        @usd_buy = rate["buy"].to_f
      when "EUR"
        @eur_buy = rate["buy"].to_f
      end
    end
    [@usd_buy, @eur_buy]
  end
end
