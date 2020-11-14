class Admin::CategoriesController < ApplicationController
#admin login
http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']

def index

  @categories= Category.order(id: :asc).all
end

def new
  @category = Category.new
end

def create
  @category = Category.new(category_params)

  if @category.save
    redirect_to [:admin, :categories], notice: 'Category created!'
  else
    render :new
  end
end

end
