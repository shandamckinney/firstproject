class SimplePagesController < ApplicationController

  def landing_page
    @products = Product.all
    @featured_product = Product.first
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(from: @email,
        to: 'mckinney.shanda@gmail.com',
        subject: "A new contact form message from #{@name}",
        body: @message).deliver_now
  end

end
