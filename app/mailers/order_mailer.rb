class OrderMailer < ApplicationMailer

  def new_order_email
    @order = params[:order]
    @url = "http://localhost:3000/"
    mail(to: @order.email, subject: "Thank you for your order, Order id:#{@order.id}")
  end
end
