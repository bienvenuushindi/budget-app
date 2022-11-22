require 'rails_helper'
RSpec.describe 'Category', type: :model do
  user= User.new(name: 'Ubs', email: 'jeanbienvenusb@gmail.com', password: 'my@password')
  subject{Category.new(user_id: user.id, name: 'Bills')}
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'name should  contain gat least 3 characters' do
    subject.name = 'n' * 2
    expect(subject).to_not be_valid
  end
end