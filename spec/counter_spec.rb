RSpec.describe LogParser::Counter do
  let(:counter) { described_class.new }

  describe "#count" do
    subject(:counter_count) { counter.count(line) }

    let(:line) { LogParser::Line.new("/home", "1.1.1.1") }

    it "increments total views value" do
      expect { counter_count }.to change { counter.total }.by(1)
    end

    it "increments unique views value" do
      expect { counter_count }.to change { counter.unique }.by(1)
    end

    it "adds line.ip to counter.ips" do
      expect { counter_count }.to change { counter.ips.length }.by(1)
    end

    describe "when line.ip is not unique" do
      before do
        counter.ips["1.1.1.1"] = true
      end

      it "does not increment unique view counter" do
        expect { counter_count }.to_not change { counter.unique }
      end

      it "does not store the line.ip into counter.ips" do
        expect { counter_count }.to_not change { counter.ips.length }
      end
    end
  end
end