class User < ApplicationRecord
  has_many :expenses, dependent: :destroy
  has_many :categories, dependent: :destroy
end
