# Helper methods defined here can be accessed in any controller or view in the application
require 'csv'

module Desafio
  class App
    module MainHelper

      def purchaser_create_or_find(name, surname)

        begin
          purchaser = Purchaser.find_by(name: name, surname: surname)
          if purchaser.nil?
            purchaser = Purchaser.new(:name => name, :surname => surname)
            purchaser.save!
          end
          return purchaser
        rescue StandardError => e
          ap e.message
          ap e.backtrace
          return nil
        end
      end

      def address_create_or_find(number, name, type_place, merchant)
        begin
          address = Address.find_by(number: number, name: name, type_place: type_place)
          if address.nil?
            address = Address.new(:number => number, :name => name, :type_place => type_place, :merchant => merchant)
            address.save!
          end
          return address
        rescue StandardError => e
          ap e.message
          ap e.backtrace
          return nil
        end
      end

      def merchant_create_or_find(name)
        begin
          merchant = Merchant.find_by(name: name)
          if merchant.nil?
            merchant = Merchant.new(:name => name)
            merchant.save!
          end
          return merchant
        rescue StandardError => e
          ap e.message
          ap e.backtrace
          return nil
        end
      end

      def item_create_or_find(description, price, merchant)
        begin
          item = Item.find_by(description: description, price: price)
          if item.nil?
            item = Item.new(:description => description, :price => price, :merchant => merchant)
            item.save!
          end
          return item
        rescue StandardError => e
          ap e.message
          ap e.backtrace
          return nil
        end
      end

      def sale_create(count, total, merchant_id, purchaser_id, item_id)
        begin
          sale = Sale.new(:count => count, :total => total, :merchant_id => merchant_id,
                   :purchaser_id => purchaser_id, :item_id => item_id)
          sale.save!
          return sale
        rescue StandardError => e
          ap e.message
          ap e.backtrace
          return nil
        end
      end

      def create_sale(csv)
        sum = 0
        CSV.open(csv, "r", {:col_sep => "\t"}).each_with_index do |csv_row, index|
          if index == 0
            next
          else
            begin
              csv_purchaser = csv_row[0].split(' ')     #[0] - name, [1] - surname
              ap csv_purchaser
              csv_address = csv_row[4].split(' ')       #[0] - number, [1] - name, [2] - type
              csv_item = csv_row[1]                     #description
              csv_item_price = csv_row[2]               #price
              csv_merchant = csv_row[5]                 #name
              csv_sale = csv_row[3]                     #count

              purchaser = purchaser_create_or_find(csv_purchaser[0], csv_purchaser[1])
              ap purchaser
              merchant = merchant_create_or_find(csv_merchant)
              address = address_create_or_find(csv_address[0], csv_address[1], csv_address[2], merchant)
              item = item_create_or_find(csv_item, csv_item_price, merchant)

              if purchaser.nil? or merchant.nil? or address.nil? or item.nil?
                raise 'Ocorreu um erro. Ao criar ou encontrar um dos elementos da venda.'
              else
                sale = sale_create(csv_sale, item.price * csv_sale.to_f, merchant.id, purchaser.id, item.id)
                sale.save!
                sum += sale.total
              end

            rescue StandardError => e
              ap e
            end
          end

        end
        return sum
      end

    end

    helpers MainHelper
  end
end
