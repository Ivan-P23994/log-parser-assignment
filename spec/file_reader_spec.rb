# frozen_string_literal: true

RSpec.describe LogParser::FileReader do
  let(:file_reader) { described_class.new(path) }
  let(:path) { File.expand_path("fixtures/test.log", __dir__) }

  describe "#lines" do
    subject(:lines) { file_reader.lines }

    let(:expected_lines) { ["/home 1.1.1.1", "/about-us 2.2.2.2", "/careers 3.3.3.3"] }

    it { is_expected.to eql(expected_lines) }

    context "with invalid path" do
      let(:path) { "missing.log" }

      it "raises error" do
        expect { lines }.to raise_error(LogParser::Error)
      end
    end
  end
end
