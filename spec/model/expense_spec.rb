require 'rails_helper'
RSpec.describe 'Expense', type: :model do
  # user=User.new(name: 'Ubs', email: 'jeanbienvenusb@gmail.com', password: 'my@password', password_confirmation: "my@password")
  subject{Expense.new(user_id: 1, name: 'Electricity', amount: 10)}
  before { subject.save }

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
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end