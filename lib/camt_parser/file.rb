module CamtParser
  class File
    def self.parse(data)
      # data = ::File.read(path)
      CamtParser::String.parse(data)
    end
  end
end
