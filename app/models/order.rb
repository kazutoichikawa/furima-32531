class Order < ApplicationRecord
  attr_accessor :token
  has_many :items

  validates :price, presence: true
  validates :token, presence: true
end
