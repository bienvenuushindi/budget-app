class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
