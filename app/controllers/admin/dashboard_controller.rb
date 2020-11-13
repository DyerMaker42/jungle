class Admin::DashboardController < ApplicationController
  
  #login for admin dash
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  def show
  end
end
