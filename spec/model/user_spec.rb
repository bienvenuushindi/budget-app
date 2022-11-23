require 'rails_helper'
RSpec.describe 'User', type: :model do
  subject { User.new(name: 'Ubs', email: 'jeanbienvenusb@gmail.com', password: 'my@password', password_confirmation: "my@password") }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'name should  contain less than 26 characters' do
    subject.name = 'u' * 30
    expect(subject).to_not be_valid
  end
  it 'name should be at least 3 characters' do
    expect(subject).to be_valid
  end

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it 'email should be valid' do
    subject.email = 'jeanbienvenusb'
    expect(subject).to_not be_valid
  end
  it 'password should be present' do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end