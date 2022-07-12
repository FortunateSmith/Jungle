class Admin::DashboardController < ApplicationController
  def show
  end
end

# QUESTIONS * is it possible to do both product and category count with one method?
#           * when referencing methods in erb, what decides if an instance variable or regular variable will be referenced

def product_count
  @product_count = Product.count(:id)
end

def category_count
  @category_count = Product.count('DISTINCT category_id')
end
