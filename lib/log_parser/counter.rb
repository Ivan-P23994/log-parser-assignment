module LogParser
  class Counter
    attr_accessor :total, :unique, :ips

    def initialize
      @total = 0
      @unique = 0
      @ips= {}
    end

    def count(line)
      self.total += 1
      unless ips[line.ip]
        self.unique += 1
        self.ips[line.ip] = true
      end
    end
  end
end