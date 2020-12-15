class Item < ApplicationRecord
  has_many :comments
  belongs_to :users

  validates :title,          presence: true
  validates :explain,        presence: true
  validates :category,       presence: true
  validates :condition,      presence: true
  validates :s_fee,          presence: true
  validates :area,           presence: true
  validates :days_to_s,      presence: true
end
