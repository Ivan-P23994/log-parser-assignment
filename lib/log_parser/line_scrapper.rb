module LogParser
  class LineScrapper
    def initialize(lines)
      @lines = lines
    end

    def scrap
      @lines.map do |line|
        Line.new(*line.split)
      end
    end
  end
end