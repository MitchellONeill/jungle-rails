class Notifier < ApplicationMailer
  default from: 'no-reply@jungle.com',
          return_path: 'system@example.com'


  def order_confirmation(order)
    @order = order
    mail(to: @order.email,
      subject: "Your Jungle order: \##{@order.id}has been processed"
      )
  end

