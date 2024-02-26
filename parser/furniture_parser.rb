require 'nokogiri'
require 'open-uri'
require 'csv'

url = 'https://www.enchantedlearning.com/wordlist/furniture.shtml#wls-id-a'

html = URI.open(url)
doc = Nokogiri::HTML(html)

div_element = doc.css('div.wordlist-item')

furniture = []

div_element.each do |item|
  furniture << item.text.strip
end

CSV.open('library/furniture.csv', "wb") do |csv|
  id = 0

  furniture.each do |name|
    csv << [id, name]
    id += 1
  end
end