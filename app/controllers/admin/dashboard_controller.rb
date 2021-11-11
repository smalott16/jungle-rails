class Admin::DashboardController < ApplicationController
  def show
    @products_count = Product.count
  end
end
