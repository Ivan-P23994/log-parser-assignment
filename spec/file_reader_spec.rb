RSpec.describe LogParser::FileReader do
  let(:file_reader) { described_class.new(path) }
  let(:path) { File.expand_path("../fixtures/test.log", __FILE__) }

  describe "#lines" do
    subject { file_reader.lines }

    let(:expected_lines) { ["/home 1.1.1.1", "/about-us 2.2.2.2", "/careers 3.3.3.3"] }

    it { is_expected.to eql(expected_lines) }
  end
end
