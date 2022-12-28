require 'rails_helper'
RSpec.describe 'HomeController', type: :request do
  describe 'get#index' do
    before(:example) do
      # get "/categories/#{subject.id}/expenses"
      get welcome_path
    end

    it 'response status success' do
      expect(response).to have_http_status(:ok)
    end

    it 'render the page' do
      expect(response).to render_template(:index)
    end

    it 'renders the correct placeholder' do
      expect(response.body).to include('Login')
      expect(response.body).to include('Sign Up')
    end
  end
end
