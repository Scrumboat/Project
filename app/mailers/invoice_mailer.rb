class InvoiceMailer < ActionMailer::Base
   default :from => "scrumboat@gmail.com"
  
  def lasku(user, invoice)  
	pdf = InvoicePdf.new(invoice)
	attachments['Lasku.pdf'] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => user.email_fax, :subject => "Lasku" , :body =>"Laskun testipostitus ")  
  end  
end
