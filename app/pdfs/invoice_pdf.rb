class InvoicePdf < Prawn::Document

  def initialize(invoice)
    super()
	@invoice = invoice
	@member = Member.find_by_jno(@invoice.jno)
    text "Lasku #{@invoice.tunniste}"
	move_down 10
	text "nimi:  #{@invoice.nimi}"
	move_down 10
	text "Jasennumero:  #{@invoice.jno}"
	move_down 10
	text "osoite:  #{@member.osoite}"
	move_down 10
	text "posti:  #{@member.posti}"
	move_down 10
	text "Email:  #{@member.email_fax}"
	move_down 10
	text "katsastussakko:  #{@invoice.katsastussakko}"
	move_down 10
	text "Laiturimaksu:  #{@invoice.laiturimaksu}"
	move_down 10
    text "Liittymismaksu:  #{@invoice.liittymismaksu}"
	move_down 10
	text "Muut maksut:  #{@invoice.muutMaksut}"
	move_down 10
	text "Talkoosakko:  #{@invoice.talkoosakko}"
	move_down 10
	text "telakkamaksu:  #{@invoice.telakkamaksu}"
	move_down 10
	text "varastokoppimaksu:  #{@invoice.varastokoppimaksu}"
	move_down 10
	text "Vartiosakko:  #{@invoice.vartiosakko}"
	move_down 10
	text "Venerekisterimaksu:  #{@invoice.venerekisterimaksu}"
	move_down 10
	text "Viivastysmaksu:  #{@invoice.karhuttu}"
	move_down 10
	text "Lisatietoja:  #{@invoice.vapaasana}"
	move_down 10
	text "Summa:  #{@invoice.summa}"
	move_down 10
	text "Viitenumero:  #{@member.viitenumero}"
	move_down 10
	text "Lahetyspvm:  #{@invoice.lahetyspvm}"
	move_down 10
	text "Erapvm:  #{@invoice.erapvm}"
	move_down 10
  end
end