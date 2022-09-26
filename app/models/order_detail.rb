class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    enum making_status: {impossible: 0, waiting: 1, start: 2, finish:3 }


    def subtotal
    item.add_tax_price * amount
    end

    def add_tax_price
     (self.price * 1.1).round
    end
end
