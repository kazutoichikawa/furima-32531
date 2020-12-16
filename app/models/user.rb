class User < ApplicationRecord
  with_options presence: true do |prese|
    has_many :items
    prese.validates :nickname
    prese.validates :email, uniqueness: true
    prese.validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: 'Include both letters and numbers'}
    prese.validates :l_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'}  
    prese.validates :f_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'}
    prese.validates :l_name_r, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
    prese.validates :f_name_r, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
    prese.validates :birthday
 
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end
end
