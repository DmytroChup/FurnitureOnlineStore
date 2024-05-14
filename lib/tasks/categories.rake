# frozen_string_literal: true

namespace :categories do
  desc "Seed categories"
  task categories: :environment do
    Category.create([
                      {category_name: "Upholstered furniture"},
                      {category_name: "Display & storage cabinets"},
                      {category_name: "Hallways"},
                      {category_name: "Beds"},
                      {category_name: "Tables"},
                      {category_name: "Armchairs & chairs"},
                      {category_name: "Garden furniture"},
                      {category_name: "Accessories"}
                    ])
    puts "Categories inserted successfully!"
  end

  desc "Seed subcategories"
  task subcategories: :environment do
    categories = Category.all
    subcategories_data = [
      {category_id: categories.find_by(category_name: "Upholstered furniture").id, subcategory_name: "Sofas"},
      {category_id: categories.find_by(category_name: "Upholstered furniture").id, subcategory_name: "Ottomans"},

      {category_id: categories.find_by(category_name: "Display & storage cabinets").id, subcategory_name: "Showcases"},
      {category_id: categories.find_by(category_name: "Display & storage cabinets").id,
       subcategory_name: "Cabinets for storage"},

      {category_id: categories.find_by(category_name: "Hallways").id, subcategory_name: "Racks"},
      {category_id: categories.find_by(category_name: "Hallways").id, subcategory_name: "Cabinets"},

      {category_id: categories.find_by(category_name: "Beds").id, subcategory_name: "Beds"},
      {category_id: categories.find_by(category_name: "Beds").id, subcategory_name: "Mattresses"},

      {category_id: categories.find_by(category_name: "Tables").id, subcategory_name: "Work tables"},
      {category_id: categories.find_by(category_name: "Tables").id, subcategory_name: "Outdoor tables"},
      {category_id: categories.find_by(category_name: "Tables").id, subcategory_name: "Gaming tables"},
      {category_id: categories.find_by(category_name: "Tables").id, subcategory_name: "Other tables"},

      {category_id: categories.find_by(category_name: "Armchairs & chairs").id, subcategory_name: "Office chairs"},
      {category_id: categories.find_by(category_name: "Armchairs & chairs").id, subcategory_name: "Dining chairs"},
      {category_id: categories.find_by(category_name: "Armchairs & chairs").id, subcategory_name: "Rocking chairs"},
      {category_id: categories.find_by(category_name: "Armchairs & chairs").id, subcategory_name: "Other chairs"},

      {category_id: categories.find_by(category_name: "Garden furniture").id, subcategory_name: "Benches"},
      {category_id: categories.find_by(category_name: "Garden furniture").id, subcategory_name: "Lounge chairs"},

      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Lights"},
      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Curtains & Blinds"},
      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Duvets & Pillows"},
      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Mirrors"},
      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Clocks"},
      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Rugs"},
      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Room dividers"},
      {category_id: categories.find_by(category_name: "Accessories").id, subcategory_name: "Other accessories"}
    ]

    Subcategory.create(subcategories_data)
    puts "Subcategories inserted successfully!"
  end

  desc "Update category descriptions"
  task update_categories: :environment do
    categories_data = [
      {category_name: "Upholstered furniture", description: "This category encompasses furniture pieces that feature cushioned seating or surfaces covered in fabric or leather upholstery. Examples include sofas, love seats, armchairs, ottomans, and upholstered beds, offering comfort and style for various interior spaces"},
      {category_name: "Display & storage cabinets", description: "Furniture pieces designed to showcase decorative items while also providing storage solutions. Display cabinets typically feature glass panels or shelves for exhibiting collectibles, while storage cabinets offer enclosed spaces such as drawers and cabinets for organizing various items"},
      {category_name: "Hallways", description: "Furniture specifically designed for hallways, transitional spaces in homes or buildings. This category includes items like consoles, hall tables, benches, coat racks, or umbrella stands, enhancing the functionality and aesthetics of hallways while providing storage and seating options"},
      {category_name: "Beds", description: "Furniture pieces designed for sleeping or resting, ranging from single to king-sized mattresses supported by frames or platforms. Beds come in various styles, such as canopy beds, bunk beds, platform beds, or traditional bed frames, catering to different preferences and room sizes"},
      {category_name: "Tables", description: "Versatile furniture pieces with flat surfaces supported by legs, used for various purposes such as dining, working, or displaying items. Tables include dining tables, coffee tables, side tables, console tables, and desks, serving as essential elements in residential, commercial, and outdoor spaces"},
      {category_name: "Armchairs & chairs", description: "Seating furniture designed for individual comfort, typically featuring armrests and backrests. Armchairs and chairs come in diverse styles, including club chairs, wing back chairs, recliners, dining chairs, accent chairs, and occasional chairs, offering functional and decorative seating options for different interior settings"},
      {category_name: "Garden furniture", description: "Outdoor furniture crafted from weather-resistant materials for use in gardens, patios, or outdoor living spaces. Garden furniture includes items like outdoor dining sets, lounge chairs, benches, hammocks, umbrellas, and garden tables, providing comfort and style for outdoor relaxation and entertainment"},
      {category_name: "Accessories", description: "Decorative and functional items used to complement and enhance the ambiance of interior spaces. Accessories encompass a wide range of items, including throw pillows, rugs, curtains, lighting fixtures, wall art, mirrors, vases, candles, and decorative objects, allowing for personalization and style expression within a room"},
    ]

    categories_data.each do |category_data|
      category = Category.find_by(category_name: category_data[:category_name])
      if category
        category.update(description: category_data[:description])
        puts "Description for '#{category.category_name}' updated successfully!"
      else
        puts "Category '#{category_data[:category_name]}' not found!"
      end
    end
  end
end
