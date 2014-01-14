class OrderMailer < ActionMailer::Base
  default from: "legoworldshop@gmail.com"

  def test_mail(address)
    mail(to: address, subject: "This is a TestMail")
  end

  def mail_order(order, language_id)
    mail(to: order.user.email, subject: I18n.t('mail_subject') + "\##{order.id}") do |format|
      format.html
      format.pdf do
        attachments["lego_shop_#{order.id}.pdf"] = WickedPdf.new.pdf_from_string(render_to_string(template: 'orders/show.pdf.erb',locals: {order: order, language_id: language_id}))
      end
    end
  end

end
