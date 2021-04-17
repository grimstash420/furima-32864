class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable  
             
   validates :password, presence: true, length: { minimum: 6 }
   validates :email, uniqueness: true
   validates :nickname, presence: true
   validates :last_name, presence: true, format: { with: /\^[ぁ-んァ-ン一-龥]/ } 
   validates :first_name, presence: true, format: { with: /\^[ぁ-んァ-ン一-龥]/ } 
   validates :last_name_kana, presence: true
   validates :first_name_kana, presence: true
   validates :birth_day, presence: true
       

end
