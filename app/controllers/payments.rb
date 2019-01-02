class PaymentsController < ApplicationController

def create
  token = params[:strikeToken]
  @product = Product.find(params[:product_id])
  @user = current_user
  begin
    charge = Stripe::Charge.create(
      amount: 2000,
      currency: "usd",
      source: token,
      description: params[:stripeEmail]
    )

    if charge.paid
      Order.create(:product_id => @product.id, :user_id => @user.id, :total => @product.price_show)
    end

  rescue Stripe::CardError => e
    # The card has been declined
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  redirect_to product_path(product)
end

end
