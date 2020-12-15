class User < ApplicationRecord
  has_many :comments
  has_many :items

 validates :nickname, presence: true
 validates :email, presence: true
 validates :password, presence: true
 validates :l_name, presence: true
 validates :f_name, presence: true
 validates :l_name_r, presence: true
 validates :f_name_r, presence: true
 validates :birthday, presence: true
 


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
