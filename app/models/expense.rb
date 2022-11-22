class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :categories
  validates :name, presence: true,  length: { minimum: 3 }
  validates :amount,presence: true, numericality: {greater_than_or_equal_to: 0}
end
