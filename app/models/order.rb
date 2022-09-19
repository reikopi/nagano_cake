class Order < ApplicationRecord

 enum payment_method: { credit_card: 0, transfer: 1 }
 enum status: { waiting: 0, deposited: 1, production: 2, preparation: 3, sent: 4 }

 has_many :order_details, dependent: :destroy
 belongs_to :customer

end
