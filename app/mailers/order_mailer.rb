class OrderMailer < ApplicationMailer

  def order_email(order)
    @order = order

    mail(to: order.email.to_s, subject: "Order ##{order.id.to_s}")

  end

end
