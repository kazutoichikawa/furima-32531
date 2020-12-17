class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :condition
  belongs_to :d_f_ship
  belongs_to :s_fee
  has_one_attached :image

  with_options presence: true do
    validates :title, length:{ maximum: 40 }
    validates :explain, length:{ maximum: 1000 }
    validates :price, numericality: {
                                    only_integer: true,
                                    greater_than_or_equal_to: 300,
                                    less_than_or_equal_to: 9999999
                                    }
    
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :s_fee_id
    validates :area_id
    validates :d_f_ship_id
  end
end
