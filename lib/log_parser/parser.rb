# frozen_string_literal: true

module LogParser
  class Parser
    def initialize(input, options = {})
      @input = input

      @formatter = options[:formatter] || Formatter
      @scrapper = options[:scrapper] || LineScrapper
      @reader = options[:reader] || FileReader
    end

    def format
      @formatter.new(group_data).format
    end

    private

    def group_data
      Grouper.new(scrap_data).group
    end

    def scrap_data
      @scrapper.new(read_data).scrap
    end

    def read_data
      @reader.new(@input).lines
    end
  end
end
