# frozen_string_literal: true

xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Furniture online store"
    xml.description "List of added products from different producers"

    @products.each do |product|
      xml.item do
        xml.title product.name
        # xml.description "Price: #{product.price}, Height: #{product.height}, Width: #{product.width},
        # Length: #{product.length}, Color: #{product.color}, Material: #{product.material}"
        xml.description do
          xml.text "Price: #{product.price}"
          xml.text "Height: #{product.height}"
          xml.text "Width: #{product.width}"
          xml.text "Length: #{product.length}"
          xml.text "Color: #{product.color}"
          xml.text "Material: #{product.material}"
          xml.text "Availability: #{product.availability}"
          xml.text "Subcategory_id: #{product.subcategory_id}, Producer_id: #{product.producer_id}"
        end
        xml.link product_url(product)
        xml.pubDate product.created_at.rfc2822
        if product.product_image.attached?
          xml.enclosure url: url_for(product.product_image), length: product.product_image.byte_size,
                        type: product.product_image.content_type
        end
      end
    end
  end
end
