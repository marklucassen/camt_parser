module CamtParser
  class Creditor
    def initialize(xml_data)
		name = xml_data.at_xpath('RltdPties/Cdtr/Nm/text()')
		@name = name.text unless name.nil?
    	iban = xml_data.at_xpath('RltdPties/CdtrAcct/Id/IBAN/text()')
      @iban = iban.text unless iban.nil?
    	bic = xml_data.at_xpath('RltdAgts/CdtrAgt/FinInstnId/BIC/text()')
		@bic = bic.text unless bic.nil?
    	bank_name = xml_data.at_xpath('RltdAgts/CdtrAgt/FinInstnId/Nm/text()')
		@bank_name = bank_name.text unless bank_name.nil?
    end

    def name
		@name
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
