class Item < ApplicationRecord

  has_one_attached :image
  enum is_active_method: { sale: 0, discontinued: 1 }
end
