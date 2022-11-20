module LogParser
  class Formatter
    def initialize(grouped_results)
      @grouped_results = grouped_results
    end

    def format
      <<~HTML
        Entries by total views:
        #{total_views}
        
        Entries by unique views:
        #{unique_views}
      HTML
    end

    private

    def total_views
      @grouped_results.sort_by_total.map do |path, counter|
        "#{path} #{counter.total} visits"
      end.join("\n")
    end

    def unique_views
      @grouped_results.sort_by_unique.map do |path, counter|
        "#{path} #{counter.unique} unique visits"
      end.join("\n")
    end
  end
end