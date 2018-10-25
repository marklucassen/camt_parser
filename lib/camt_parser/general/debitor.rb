module CamtParser
  class Debitor
    attr_reader :name, :iban, :bic, :bank_name

    def initialize(xml_data)
      name = xml_data.at_xpath('RltdPties/Dbtr/Nm/text()')
      @name = name.text unless name.nil?
      iban = xml_data.at_xpath('RltdPties/DbtrAcct/Id/IBAN/text()')
      @iban = iban.text unless iban.nil?
      bic = xml_data.at_xpath('RltdAgts/DbtrAgt/FinInstnId/BIC/text()')
      @bic = bic.text unless bic.nil?
      bank_name = xml_data.at_xpath('RltdAgts/DbtrAgt/FinInstnId/Nm/text()')
      @bank_name = bank_name.text unless bank_name.nil?
    end
  end
end
