# frozen_string_literal: true
namespace :translations do
  desc 'Generate translations YML file'
  task generate: :environment do
    products_data = Product.pluck(:name)
    File.open('config/locales/products.en.yml', 'w') do |file|
      products_data.each do |product_name|
        file.puts "#{product_name}: \"#{product_name}\""
      end
    end
    puts 'YML файл з перекладами згенеровано успішно!'
  end
end
