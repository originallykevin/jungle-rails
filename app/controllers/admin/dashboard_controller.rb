class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_USERNAME'], password: ENV['HTTP_PASSWORD']
  def show
  # Display a count of how many products are in the database
    @product_count = Product.count
  # Display a count of how many categories are in the database
    @category_count = Category.count
  end
end
