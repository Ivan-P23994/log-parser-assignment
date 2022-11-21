# frozen_string_literal: true

require_relative "log_parser/version"
require_relative "log_parser/file_reader"
require_relative "log_parser/line"
require_relative "log_parser/line_scrapper"
require_relative "log_parser/counter"
require_relative "log_parser/grouper"
require_relative "log_parser/grouped_results"
require_relative "log_parser/formatter"
require_relative "log_parser/parser"

module LogParser
  class Error < StandardError; end
  # Your code goes here...
end
