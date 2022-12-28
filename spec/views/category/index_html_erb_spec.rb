require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Ubs', email: 'jeanbienvenusb@gmail.com', password: 'my@password',
                          password_confirmation: 'my@password')
      visit new_user_session_path
      sign_in @user
      @category = Category.create(name: 'Ushindi',
                                  icon: 'https://i.picsum.photos/id/8/5000/3333.jpg?hmac=OeG5ufhPYQBd6Rx1TAldAuF92lhCzAhKQKttGfawWuA',
                                  total_amount: 0, author: @user)
      visit categories_path
    end

    scenario 'has the names of all categories' do
      expect(page).to have_content(@category.name)
    end

    scenario 'has the total amount on each category' do
      expect(page).to have_content(@category.total_amount)
    end

    it "has a category's icon " do
      expect(page).to have_css("img[src*='#{@category.icon}']")
    end

    it "navigates to the transactions' page" do
      click_on(id: "category-#{@category.id}")
      expect(page).to have_current_path(category_expenses_path(@category.id))
    end

    it "navigates to add new category's page" do
      click_on('Add category')
      expect(page).to have_current_path(new_category_path)
    end

    it "redirects to splash' page" do
      click_on('Logout')
      expect(page).to have_current_path(welcome_path)
    end
  end
end
