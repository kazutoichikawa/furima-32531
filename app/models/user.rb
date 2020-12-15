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
 validates :bday_y, presence: true
 validates :bday_m, presence: true
 validates :bday_d, presence: true


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
