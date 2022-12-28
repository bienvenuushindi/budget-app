// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener('click', (e) => {
  if (e.target.id === 'process-form') {
    const Form = document.getElementById('new_user') ||
            document.getElementById('new-category') ||
            document.getElementById('new-transaction')
    Form.submit()
  }
})
