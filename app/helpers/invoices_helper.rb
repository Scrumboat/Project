#encoding: utf-8

module InvoicesHelper

  def self.popover_text(invoice)
    o = {
        'suorituksetKassaan' => nil,
        'liittymismaksu' => nil,
        'jasenmaksu' => 'Jäsenmaksu',
        'venerekisterimaksu' => nil,
        'varastokoppimaksu' => nil,
        'laiturimaksu' => nil,
        'ensirekisterimaksu' => nil,
        'telakkamaksu' => nil,
        'muutMaksut' => nil,
        'talkoosakko' => nil,
        'katsastussakko' => nil,
        'vartiosakko' => nil,
        'laskutuslisa' => 'Laskutuslisä'
    }

    text = ""
    total = 0.0
    text << "<b>Tunniste: </b> #{invoice.send(:tunniste)} <br />"
    text << "<b>Eräpäivä: </b>" << (invoice.eraantynyt() ? "<span style=\"color:#FF0000\"> #{invoice.erapvm.strftime('%d.%m.%Y')} </span> <br />" : "#{invoice.erapvm.strftime('%d.%m.%Y')} <br />")
    o.each do |nimi|
      nimi = nimi.first.to_sym
      unless invoice.send(nimi).blank?
        text << "<b> #{nimi_to_human(nimi.to_s, o)} </b>  #{invoice.send(nimi).to_s} <br />"
        total = total + invoice.send(nimi).to_f if invoice.send(nimi)
      end
    end
    text << "<hr/><b>Summa: </b>  #{total.to_s}"
  end

  def self.nimi_to_human(nimi, o)
    o[nimi] || nimi.underscore.humanize
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
