class Order < ApplicationRecord
  has_many :items

  validates :price, presence: true
end
