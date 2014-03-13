class Purchase < ActiveRecord::Base

  # validations
  validates_presence_of :purchaser_name, :item_description, :item_price,
      :purchase_count, :merchant_address, :merchant_name

  validates_numericality_of :item_price, :purchase_count

end
