RSpec.describe LogParser::LineScrapper do
  let(:scrapper) { described_class.new(lines) }

  let(:lines) {
    [
      "/home 1.1.1.1",
      "/products 2.2.2.2"
    ]
  }

  describe "#scrap" do
    subject { scrapper.scrap }

    let(:expected_lines) {
      [
        LogParser::Line.new("/home", "1.1.1.1"),
        LogParser::Line.new("/products", "2.2.2.2")
      ]
    }

    it { is_expected.to eql(expected_lines) }
  end
end