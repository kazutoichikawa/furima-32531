class Item < ApplicationRecord
  has_many :comments
  belongs_to :users
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :d_f_ship
  belongs_to :s_fee

  with_options presence: true do
    validates :title
    validates :explain
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :s_fee_id
    validates :area_id
    validates :d_f_ship_id
  end
end
