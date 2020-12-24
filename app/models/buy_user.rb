class BuyUser
  include ActiveModel::Model
  attr_accessor :p_code, :prefecture_id, :city, :address, :building, :p_num, :user_id, :item_id, :token, :image
  with_options presence: true do
    validates :p_code,        format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :p_num, format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0[-]?\d{4}[-]?\d{4}\z/},
                      length: { in: 1..11 }
    validates :token
    validates :user_id
    validates :item_id
  end
  def save
    purchase_m = PurchaseM.create(user_id: user_id, item_id: item_id)
    Address.create(p_code: p_code, prefecture_id: prefecture_id, city: city, address: address, building: building, p_num: p_num, purchase_m_id: purchase_m.id)
    
  end
end