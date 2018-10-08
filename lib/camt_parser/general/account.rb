module CamtParser
  class Account
    def initialize(xml_data)
      @xml_data = xml_data
    end

    def iban
      @iban ||= @xml_data.at_xpath('Id/IBAN/text()').text
    end

    def bic
      @bic ||= @xml_data.at_xpath('Svcr/FinInstnId/BIC/text()').text
    end

    def bank_name
      @bank_name ||= @xml_data.at_xpath('Svcr/FinInstnId/Nm/text()').text
    end
  end
end
