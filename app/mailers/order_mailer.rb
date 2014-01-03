class OrderMailer < ActionMailer::Base
  default from: "legoworldshop@gmail.com"

  def test_mail(address)
    mail(to: address, subject: "This is a TestMail")
  end

  def mail_order(order)
    mail(to: order.user.email, subject: "New Order \##{order.id}") do |format|
      format.html
      format.pdf do
        attachments["LW_ORDER_#{order.id}.pdf"] = WickedPdf.new.pdf_from_string(render_to_string(template: 'orders/show.pdf.erb',locals: {order: order}))
      end
    end
  end

end
