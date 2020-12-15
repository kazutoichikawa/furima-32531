class User < ApplicationRecord
  has_many :comments
  has_many :items

 validates :nickname, presence: true
 validates :email, presence: true
 validates :password, presence: true,
                      format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
 validates :l_name, presence: true,
                      format: { with: /\A[ぁ-んァ-ン一-龥]/}
 validates :f_name, presence: true,
                      format: { with: /\A[ぁ-んァ-ン一-龥]/}
 validates :l_name_r, presence: true,
                      format: { with: /\A[ァ-ヶー－]+\z/}
 validates :f_name_r, presence: true,
                      format: { with: /\A[ァ-ヶー－]+\z/}
 validates :birthday, presence: true
 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
