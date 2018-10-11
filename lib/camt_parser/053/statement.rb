module CamtParser
  module Format053
    class Statement
      def initialize(xml_data)
        # @xml_data = xml_data
        @entries = xml_data.xpath('Ntry').map{ |x| Entry.new(x) }
        @account = Account.new(xml_data.at_xpath('Acct'))
      end

      # def identification
      #   @identification = @xml_data.at_xpath('Id/text()').text
      # end

      # def generation_date
      #   @generation_date = Time.parse(@xml_data.at_xpath('CreDtTm/text()').text)
      # end

      # def from_date_time
      #   @from_date_time = (x = @xml_data.at_xpath('FrToDt/FrDtTm')).empty? ? nil : Time.parse(x.content)
      # end

      # def to_date_time
      #   @to_date_time = (x = @xml_data.at_xpath('FrToDt/ToDtTm')).empty? ? nil : Time.parse(x.content)
      # end

      def account
        @account
      end

      def entries
        @entries
      end

      # def legal_sequence_number
      #   @legal_sequence_number = @xml_data.at_xpath('LglSeqNb/text()').text
      # end

      # def electronic_sequence_number
      #   @electronic_sequence_number = @xml_data.at_xpath('ElctrncSeqNb/text()').text
      # end

      # def opening_balance
      #   @opening_balance = begin
      #     bal = @xml_data.at_xpath('Bal/Tp//Cd[contains(text(), "OPBD") or contains(text(), "PRCD")]').ancestors('Bal')
      #     date = bal.at_xpath('Dt/Dt/text()').text
      #     currency = bal.at_xpath('Amt').attribute('Ccy').value
      #     AccountBalance.new bal.at_xpath('Amt/text()').text, currency, date, true
      #   end
      # end
      # alias_method :opening_or_intermediary_balance, :opening_balance

      # def closing_balance
      #   @closing_balance = begin
      #     bal = @xml_data.at_xpath('Bal/Tp//Cd[contains(text(), "CLBD")]').ancestors('Bal')
      #     date = bal.at_xpath('Dt/Dt/text()').text
      #     currency = bal.at_xpath('Amt').attribute('Ccy').value
      #     AccountBalance.new bal.at_xpath('Amt/text()').text, currency, date, true
      #   end
      # end
      # alias_method :closing_or_intermediary_balance, :closing_balance

      # def source
      #   @xml_data.to_s
      # end

      # def self.parse(xml)
		  # self.new Oga.parse_xml(xml).at_xpath('Stmt')
      # end
    end
  end
end
