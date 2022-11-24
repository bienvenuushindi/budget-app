require 'rails_helper'

RSpec.describe 'Transaction', type: :feature do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Ubs', email: 'jeanbienvenusb@gmail.com', password: 'my@password',
                          password_confirmation: 'my@password')
      visit new_user_session_path
      sign_in @user
      @category = Category.create(name: 'Ushindi',
                                  icon: 'https://i.picsum.photos/id/8/5000/3333.jpg?hmac=OeG5ufhPYQBd6Rx1TAldAuF92lhCzAhKQKttGfawWuA',
                                  total_amount: 0, author: @user)
      @expense = Expense.create(author: @user, name: 'Electricity', amount: 10)
      @expense.categories << @category
      visit category_expenses_path(@category)
    end

    scenario 'has the names of all expenses' do
      expect(page).to have_content(@expense.name)
    end

    scenario 'displays the total amount ' do
      expect(page).to have_content(@category.total_amount)
    end

    it "navigates to add new transaction's page" do
      click_on('Add Transaction')
      expect(page).to have_current_path(new_category_expense_path(@category.id))
    end

    it "redirects to splash' page" do
      click_on('Back')
      expect(page).to have_current_path(categories_path)
    end
  end
end
