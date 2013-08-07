class InvoiceMailer < ActionMailer::Base
   default :from => "scrumboat@gmail.com"
  
  def lasku(user, invoice)  
    #attachments['free_book.pdf'] = File.read('path/to/file.pdf')
	pdf = InvoicePdf.new(invoice)
	#attachments['Lasku.pdf'] = File.read(invoice_path(invoice.id, :format => "pdf"))
	attachments['Lasku.pdf'] = { :mime_type => 'application/pdf', :content => pdf.render }
    mail(:to => user.EmailFax, :subject => "Lasku" , :body =>"Laskun testipostitus ")  
  end  
end
