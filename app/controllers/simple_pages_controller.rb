class SimplePagesController < ApplicationController

  def landing_page
    @products = Product.all
    @featured_product = Product.first
  end


end
