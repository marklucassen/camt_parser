module CamtParser
  class Charges
    def initialize(xml_data)
      @xml_data = xml_data
      @total_charges_and_tax_amount = @xml_data.at_xpath('TtlChrgsAndTaxAmt/text()').text
    end

    def total_charges_and_tax_amount
      CamtParser::Misc.to_amount(@total_charges_and_tax_amount)
    end

    def total_charges_and_tax_amount_in_cents
      CamtParser::Misc.to_amount_in_cents(@total_charges_and_tax_amount)
    end

    def records
      @records ||= @xml_data.at_xpath('Rcrd').map{ |x| CamtParser::Record.new(x) }
    end
  end
end
