# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def new_order_email
    # Set up a temporary order for the preview
    order = Order.new(total_cents: 100000, stripe_charge_id: "blah", email: "example@example.com")

    OrderMailer.with(order: order).new_order_email
  end
end
