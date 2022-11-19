module LogParser
  class FileReader
    def initialize(path)
      @path = path
    end

    def lines
      open.each.map(&:chomp)
    end

    private

    def open
      File.open(@path, "r")
    rescue Errno::ENOENT => e
      raise LogParser::Error, e.message
    end
  end
end