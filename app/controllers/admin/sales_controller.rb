class Admin::SalesController < ApplicationController

  def index
    @sales = Product.all
  end

end
