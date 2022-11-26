class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :categories, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_category_total_amount
  before_destroy :reduce_category_total_amount

  private

  def update_category_total_amount
    categories.each do |category|
      category.increment!(:total_amount, amount)
    end
  end

  def reduce_category_total_amount
    categories.each do |category|
      category.decrement!(:total_amount, amount)
    end
  end
end
