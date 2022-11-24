require 'rails_helper'
RSpec.describe 'Sign Up process', type: :feature, js: true do
  before :each do
    visit new_user_registration_path
  end
  scenario 'valid inputs' do
    fill_in 'Name', with: 'My Name'
    fill_in 'Email', with: "reta#{rand(252...4350)}@mailinator.com"
    fill_in 'Password', with: 'Pa$$w0rd!'
    page.execute_script("document.getElementById('new_user').submit()")
    expect(current_path).to eq(categories_path)
    expect(page).to have_text('You have signed up successfully')
  end

  it 'redirects to welcome page' do
    click_on('Back')
    expect(page).to have_current_path(welcome_path)
  end
end