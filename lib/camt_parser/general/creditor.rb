module CamtParser
  class Creditor
    def initialize(xml_data)
      @xml_data = xml_data
    end

    def name
		name = @xml_data.at_xpath('RltdPties/Dbtr/Nm/text()')
		name = name.text unless name.nil?
    end

    def iban
    	iban = @xml_data.at_xpath('RltdPties/DbtrAcct/Id/IBAN/text()')
      iban = iban.text unless iban.nil?
    end

    def bic
    	bic = @xml_data.at_xpath('RltdAgts/DbtrAgt/FinInstnId/BIC/text()')
		bic = bic.text unless bic.nil?
    end

    def bank_name
    	bank_name = @xml_data.at_xpath('RltdAgts/DbtrAgt/FinInstnId/Nm/text()')
		bank_name = bank_name.text unless bank_name.nil?
    end
  end
end
