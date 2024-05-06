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
end
