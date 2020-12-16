class User < ApplicationRecord
  has_many :items

 validates :nickname, presence: true
 validates :email, presence: true, uniqueness: true
 validates :password, presence: true,
                      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/, message: 'Include both letters and numbers'}
 validates :l_name, presence: true, 
                    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'}  
 validates :f_name, presence: true,
                      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters'}
 validates :l_name_r, presence: true,
                      format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
 validates :f_name_r, presence: true,
                      format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters'}
 validates :birthday, presence: true
 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
