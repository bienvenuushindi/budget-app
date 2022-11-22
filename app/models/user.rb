class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, dependent: :destroy
  has_many :categories, dependent: :destroy
  validates :name, presence: true, length: { in: 3..25 }
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true,length: { minimum: 6 }
end
