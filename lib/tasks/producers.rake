# frozen_string_literal: true

namespace :producers do
  desc "Create a new producer"
  task create_producer: :environment do
    producer_data = [
      {producer_name: "Producer1", country: "Ukraine", phone: "0631111111", email: "producer1@karazin.ua",
password: "12345678"},
      {producer_name: "Producer2", country: "Ukraine", phone: "0632222222", email: "producer2@karazin.ua",
password: "12345678"}
    ]

    producer_data.each do |data|
      producer = Producer.new(data)

      if producer.save
        puts "Producer '#{producer.producer_name}' created successfully."
      else
        puts "Error creating producer: #{producer.errors.full_messages.join(', ')}"
      end
    end
  end
end
