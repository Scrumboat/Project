#encoding: utf-8

module InvoicesHelper


  def self.popover_text(invoice)
    text = '<b>Viitenumero: </b>' + invoice.member.viitenumero.to_s + '<br />'
    total = 0
    if !invoice.tunniste.blank?
      text = text + '<b>Tunniste: </b>' + invoice.tunniste + '<br />'
    end
    if !invoice.suorituksetKassaan.blank?
      text = text + '<b>Suoritukset kassaan: </b> ' + invoice.suorituksetKassaan.to_s + '<br />'
      total = total + invoice.suorituksetKassaan
    end
    if !invoice.liittymismaksu.blank?
      text = text + '<b>Liittymismaksu: </b> ' + invoice.liittymismaksu.to_s + '<br />'
      total = total + invoice.liittymismaksu
    end
    if !invoice.jasenmaksu.blank?
      text = text + '<b>Jäsenmaksu: </b>' + invoice.jasenmaksu.to_s + '<br />'
      total = total + invoice.jasenmaksu
    end
    if !invoice.venerekisterimaksu.blank?
      text = text + '<b>Venerekisterimaksu: </b>' + invoice.venerekisterimaksu.to_s + '<br />'
      total = total + invoice.venerekisterimaksu
    end
    if !invoice.varastokoppimaksu.blank?
      text = text + '<b>Varastokoppimaksu: </b>' + invoice.varastokoppimaksu.to_s + '<br />'
      total = total + invoice.varastokoppimaksu
    end
    if !invoice.laiturimaksu.blank?
      text = text + '<b>Laiturimaksu: </b>' + invoice.laiturimaksu.to_s + '<br />'
      total = total + invoice.laiturimaksu
    end
    if !invoice.ensirekisterimaksu.blank?
      text = text + '<b>Ensirekisterimaksu: </b>' + invoice.ensirekisterimaksu.to_s + '<br />'
      total = total + invoice.ensirekisterimaksu
    end
    if !invoice.telakkamaksu.blank?
      text = text + '<b>Telakkamaksu: </b>' + invoice.telakkamaksu.to_s + '<br />'
      total = total + invoice.telakkamaksu
    end
    if !invoice.muutMaksut.blank?
      text = text + '<b>Muut maksut: </b>' + invoice.muutMaksut.to_s + '<br />'
      total = total + invoice.muutMaksut
    end
    if !invoice.talkoosakko.blank?
      text = text + '<b>Talkoosakko: </b>' + invoice.talkoosakko.to_s + '<br />'
      total = total + invoice.talkoosakko
    end
    if !invoice.katsastussakko.blank?
      text = text + '<b>Katsastussakko: </b>' + invoice.katsastussakko.to_s + '<br />'
      total = total + invoice.katsastussakko
    end
    if !invoice.vartiosakko.blank?
      text = text + '<b>Vartiosakko: </b>' + invoice.vartiosakko.to_s + '<br />'
      total = total + invoice.vartiosakko
    end
    if !invoice.laskutuslisa.blank?
      text = text + '<b>Laskutuslisä: </b>' + invoice.laskutuslisa.to_s + '<br />'
      total = total + invoice.laskutuslisa
    end
    text = text + '<hr/><b>Yhteensä: </b>' + total.to_s
    text
  end


  def self.parse_ref_numbers_from_file(file)
    result_array = Array.new()
    data = file.read
    lines = data.split("\r\n")
    Rails.logger.fatal lines.inspect
    lines.each do |line|
      if line[0].to_i == 3                              # 3 on VIITEMAKSU, tarvitaanko suoraveloituksia (5)?
        ref_number = line[43, 20]
        amount = line[77, 10]
        result_array.push({:ref_number => ref_number, :amount => amount})
      end
    end
    return result_array
  end

  #12222222222222233333344444455555555555555556666666666666666666677777777777789aaaaaaaaaabcd
end
