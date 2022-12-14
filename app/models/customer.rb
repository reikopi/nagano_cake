class Customer < ApplicationRecord

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :addresses, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 has_many :orders, dependent: :destroy

# enum is_active: { member: 0, withdrawal: 1 }

  def full_name
    last_name+first_name
  end

  def full_name_kana
    last_name_kana+first_name_kana
  end

  def own_infomation
    postal_code+address+full_name
  end

end
