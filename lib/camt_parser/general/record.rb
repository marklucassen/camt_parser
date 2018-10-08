module CamtParser
  class Record
    def initialize(xml_data)
      @xml_data = xml_data
      @amount = @xml_data.at_xpath('Amt/text()').text
      @debit = @xml_data.at_xpath('CdtDbtInd/text()').text.upcase == 'DBIT'
    end

    def amount
      CamtParser::Misc.to_amount(@amount)
    end

    def amount_in_cents
      CamtParser::Misc.to_amount_in_cents(@amount)
    end

    def currency
      @currency = @xml_data.at_xpath('Amt/@Ccy').text
    end

    def type
      @type = CamtParser::Type::Builder.build_type(@xml_data.at_xpath('Tp'))
    end

    def charges_included?
      @charges_included = @xml_data.at_xpath('ChrgInclInd/text()').text.downcase == 'true'
    end

    def debit
      @debit
    end

    def credit?
      !debit
    end

    def debit?
      debit
    end

    def sign
      credit? ? 1 : -1
    end
  end
end
