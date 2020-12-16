class User < ApplicationRecord
  has_many :items
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: 'Include both letters and numbers'}
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'} do
     validates :l_name 
     validates :f_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'} do
     validates :l_name_r
     validates :f_name_r
    end
    validates :birthday
  end
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
