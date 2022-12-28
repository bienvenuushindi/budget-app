class HomeController < ApplicationController
  layout 'splash'
  before_action :authenticate_user!, except: [:index]
  def index; end
end
