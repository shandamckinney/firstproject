class SimplePagesController < ApplicationController

  def landing_page
    @products = Product.limit(3)
    @featured_product = Product.limit(3)
  end


end
