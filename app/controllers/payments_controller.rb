class PaymentsController < ApplicationController

  before_action :authenticate_user!

    def create
      @product = Product.find(params[:product_id])
      @user = current_user
      token = params[:stripeToken]

        charge = Stripe::Charge.create(
          amount: @product.price*100.to_i
          currency: "EUR",
          source: token,
          description: params[:stripeEmail]
        )

      if charge.paid

        Order.create!(:product_id => @product.id, :user_id => @user.id, :total => @product.price)
      end

      rescue Stripe::CardError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]} Your card has not been charged. Please try again."
      end
      redirect_to product_path(@product), notice: "Thank you for your purchase."
    end

end
