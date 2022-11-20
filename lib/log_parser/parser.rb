module LogParser
  class Parser
    def initialize(input, options ={})
      @input = input

      @formatter = options[:formatter] || Formatter
      @scrapper = options[:scrapper] || LineScrapper
      @reader = options[:reader] || FileReader
    end

    def format
      @formatter.new(grouped_data).format
    end

    private

    def grouped_data
      Grouper.new(scrapped_data).group
    end

    def scrapped_data
      @scrapper.new(read_data).scrap
    end

    def read_data
      @reader.new(@input).lines
    end
  end
end