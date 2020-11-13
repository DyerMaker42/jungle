class Admin::DashboardController < ApplicationController
  
  #login for admin dash
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  def show
    @product_count = Product.count
    @category_count = Category.count
  end


end
