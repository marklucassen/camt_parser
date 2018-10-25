module CamtParser
  class Account
    attr_reader :iban, :bic, :bank_name

    def initialize(xml_data)
      iban = xml_data.at_xpath('Id/IBAN/text()')
      @iban = iban.text unless iban.nil?
      bic = xml_data.at_xpath('Svcr/FinInstnId/BIC/text()')
      @bic = bic.text unless bic.nil?
      bank_name = xml_data.at_xpath('Svcr/FinInstnId/Nm/text()')
      @bank_name = bank_name.text unless bank_name.nil?
    end
  end
end
