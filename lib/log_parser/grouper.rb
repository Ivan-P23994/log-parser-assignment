module LogParser
  class Grouper
    def initialize(lines)
      @lines = lines
    end

    def group
      @lines.each_with_object(GroupedResults.new) do |line, collection|
        collection[line.path] ||= Counter.new
        collection[line.path].count(line)
      end
    end
  end
end