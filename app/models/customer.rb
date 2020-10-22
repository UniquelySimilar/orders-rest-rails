class Customer < ApplicationRecord
  has_many :orders

  validates :first_name, :last_name, :city, length: { in: 2..50 }
  validates :zipcode, length: { is: 5 }, numericality: { only_integer: true }
  validates :home_phone, length: { is: 10 }, numericality: { only_integer: true }
  validates :work_phone, length: { is: 10 }, numericality: { only_integer: true }, allow_blank: true
  validates :email,
  format: { with: /\A(.+)@(.+)\z/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
end
