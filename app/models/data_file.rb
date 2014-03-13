require "csv"

class DataFile < ActiveRecord::Base
  attr_accessor :total

  mount_uploader :data, DataFileUploader

  def parse
    return false unless data && data.current_path.present?
    @total = 0
    filename = data.current_path

    CSV.foreach( filename, col_sep: "\t", headers: true ) do |row|
      purchase = Purchase.create(
        purchaser_name: row[ "purchaser name" ],
        item_description: row[ "item description" ],
        item_price: row[ "item price" ],
        purchase_count: Integer( row[ "purchase count" ] ),
        merchant_address: row[ "merchant address" ],
        merchant_name: row[ "merchant name" ] )

      return false unless purchase && purchase.valid?
      @total += purchase.item_price
    end

    return true
  end
end
