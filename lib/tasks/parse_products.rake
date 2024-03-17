namespace :products do
  desc 'Parse products and save to the database'
  task parse: :environment do
    require 'nokogiri'
    require 'open-uri'

    url = 'https://www.enchantedlearning.com/wordlist/furniture.shtml#wls-id-a'
    html = URI.open(url)
    doc = Nokogiri::HTML(html)

    div_element = doc.css('div.wordlist-item')

    div_element.each do |item|
      name = item.text.strip
      Product.create(name: name)
    end

    puts 'Products data parsed and saved!'
  end
end
