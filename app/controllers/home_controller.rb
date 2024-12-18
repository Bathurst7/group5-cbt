class HomeController < ApplicationController
  before_action :authenticate_user! # Ensures only logged-in users can access this controller

  def index
    # Your homepage logic here
  end
end