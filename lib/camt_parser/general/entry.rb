module CamtParser
  class Entry
    def initialize(xml_data)
      @xml_data = xml_data
      @amount = @xml_data.at_xpath('Amt/text()').text
    end

    def amount
      CamtParser::Misc.to_amount(@amount)
    end

    def amount_in_cents
      CamtParser::Misc.to_amount_in_cents(@amount)
    end

    def currency
      @currency ||= @xml_data.at_xpath('Amt/@Ccy').text
    end

    def debit
      @debit ||= @xml_data.at_xpath('CdtDbtInd/text()').text.upcase == 'DBIT'
    end

    def value_date
      @value_date ||= Date.parse(@xml_data.at_xpath('ValDt/Dt/text()').text)
    end

    def booking_date
      @booking_date ||= Date.parse(@xml_data.at_xpath('BookgDt/Dt/text()').text)
    end

    def transactions
      @transactions ||= parse_transactions
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

    def reversal?
      @reversal ||= @xml_data.at_xpath('RvslInd/text()').text.downcase == 'true'
    end

    def booked?
      @booked ||= @xml_data.at_xpath('Sts/text()').text.upcase == 'BOOK'
    end

    def additional_information
      @additional_information ||= @xml_data.at_xpath('AddtlNtryInf/text()').text
    end

    def description
		# search beginning of string (+6 chars own length)
		index = additional_information.index("/REMI/")
		return if index.nil?
		index += 6
		# strip beginning
		description = additional_information[index..-1]

		index = description.index("/") - 1
		# strip end
		description = description[0..index]
	end

    def charges
      @charges ||= CamtParser::Charges.new(@xml_data.at_xpath('Chrgs'))
    end

    private

    def parse_transactions
      transaction_details = @xml_data.xpath('NtryDtls/TxDtls')

      amt = nil
      ccy = nil

      if transaction_details.length == 1
		  amt = @xml_data.at_xpath('Amt/text()').text
		  ccy = @xml_data.at_xpath('Amt/@Ccy').text
      end

      @xml_data.xpath('NtryDtls/TxDtls').map { |x| Transaction.new(x, debit?, amt, ccy) }
    end
  end
end
