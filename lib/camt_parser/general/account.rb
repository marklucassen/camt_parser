module CamtParser
  class Account
    def initialize(xml_data)
      @iban = xml_data.at_xpath('Id/IBAN/text()').text
      @bic = xml_data.at_xpath('Svcr/FinInstnId/BIC/text()').text
      @bank_name = xml_data.at_xpath('Svcr/FinInstnId/Nm/text()').text
    end

    def iban
      @iban
    end

    def bic
      @bic
    end

    def bank_name
      @bank_name
    end
  end
end
