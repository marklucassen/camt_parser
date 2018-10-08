module CamtParser
  class Creditor
    def initialize(xml_data)
      @xml_data = xml_data
    end

    def name
      @name ||= @xml_data.at_xpath('RltdPties/Cdtr/Nm/text()').text
    end

    def iban
      @iban ||= @xml_data.at_xpath('RltdPties/CdtrAcct/Id/IBAN/text()').text
    end

    def bic
      @bic ||= @xml_data.at_xpath('RltdAgts/CdtrAgt/FinInstnId/BIC/text()').text
    end

    def bank_name
      @bank_name ||= @xml_data.at_xpath('RltdAgts/CdtrAgt/FinInstnId/Nm/text()').text
    end
  end
end
