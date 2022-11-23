require 'rails_helper'
RSpec.describe 'Expense', type: :model do
  user= User.new(name: 'Ubs', email: 'jeanbienvenusb@gmail.com', password: 'my@password')
  subject{Expense.new(author: user, name: 'Electricity', amount: 10)}
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'name should  contain gat least 3 characters' do
    subject.name = 'n' * 2
    expect(subject).to_not be_valid
  end
  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  it 'amount should be non-negative integer' do
    expect(subject).to_not be_valid
  end
  it 'has and belongs to many categories' do
    should have_and_belong_to_many :categories
  end
end