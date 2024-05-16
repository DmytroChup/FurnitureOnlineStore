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

  def display_price(product_price, usd_buy, eur_buy, preferred_currency)
    case preferred_currency
    when 'UAH'
      number_to_currency(product_price, precision: 2, unit: '', format: "%n ₴")
    when 'USD'
      number_to_currency(product_price / usd_buy, precision: 2, unit: '', format: "%n $") if usd_buy.present?
    when 'EUR'
      number_to_currency(product_price / eur_buy, precision: 2, unit: '', format: "%n €") if eur_buy.present?
    else
      number_to_currency(product_price, precision: 2, unit: '', format: "%n ₴")
    end
  end
end
