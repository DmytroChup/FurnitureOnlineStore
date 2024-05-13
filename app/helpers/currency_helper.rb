# frozen_string_literal: true

module CurrencyHelper
  def display_currency_rates(user)
    return unless user&.preferred_currency

    currency_rates = PrivatbankApi.fetch_currency_rates
    usd_buy, usd_sale, eur_buy, eur_sale = nil

    currency_rates.each do |rate|
      case rate["ccy"]
      when "USD"
        usd_buy = rate["buy"].to_f
        usd_sale = rate["sale"].to_f
      when "EUR"
        eur_buy = rate["buy"].to_f
        eur_sale = rate["sale"].to_f
      end
    end

    if user.preferred_currency == "UAH"
      "USD-UAH: #{t('currency.buy')} - #{'%.1f' % usd_buy}, #{t('currency.sale')} - #{'%.1f' % usd_sale}"
    elsif user.preferred_currency == "EUR"
      "EUR-USD: #{t('currency.buy')} - #{'%.1f' % (usd_buy / eur_buy)}, #{t('currency.sale')} - #{'%.1f' %
        (usd_sale / eur_sale)}"
    end
  end
end
