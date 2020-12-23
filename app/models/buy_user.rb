class BuyUser
  include ActiveModel::Model
  attr_accessor :p_code, :prefecture_id, :city, :address, :building, :p_num, :user_id, :item_id, :token
  with_options presence: true do
    validates :p_code
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :building
    validates :p_num
  end
  def save
    # binding.pry
    purchase_m = PurchaseM.create(user_id: user_id, item_id: item_id)
    Address.create!(p_code: p_code, prefecture_id: prefecture_id, city: city, address: address, building: building, p_num: p_num, purchase_m_id: purchase_m.id)
    
  end
end