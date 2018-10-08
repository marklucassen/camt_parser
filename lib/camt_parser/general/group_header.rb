require 'time'

module CamtParser
  class GroupHeader
    attr_reader :message_id, :creation_date_time, :additional_information, :message_pagination

    def initialize(xml_data)
		@message_id             = xml_data.at_xpath('MsgId/text()')
		@message_id             = @message_id.text unless @message_id.nil?
		@creation_date_time     = Time.parse(xml_data.at_xpath('CreDtTm/text()').text) unless xml_data.at_xpath('CreDtTm/text()').nil?
      @message_pagination     = (x = xml_data.at_xpath('MsgPgntn')).nil? ? nil : MessagePagination.new(x)
      @additional_information = xml_data.at_xpath('AddtlInf/text()')
	  @additional_information = @additional_information.text unless @additional_information.nil?
    end
  end

  class MessagePagination
    attr_reader :page_number

    def initialize(xml_data)
      @page_number         = xml_data.at_xpath('PgNb/text()').text.to_i
      @last_page_indicator = xml_data.at_xpath('LastPgInd/text()').text == 'true'
    end

    def last_page?
      @last_page_indicator
    end
  end
end
