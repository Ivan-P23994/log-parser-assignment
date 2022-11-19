module LogParser
  class FileReader
    def initialize(path)
      @path = path
    end

    def lines
      File.open(@path, "r").each.map(&:chomp)
    end
  end
end