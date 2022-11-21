# frozen_string_literal: true

RSpec.describe LogParser::Formatter do
  let(:formatter) { described_class.new(grouped_results) }
  let(:grouped_results) do
    LogParser::GroupedResults[
      "/about" => instance_double(LogParser::Counter, unique: 5, total: 100),
      "/home" => instance_double(LogParser::Counter, unique: 10, total: 25),
      "/contact-us" => instance_double(LogParser::Counter, unique: 2, total: 140)
    ]
  end

  describe "#format" do
    subject { formatter.format }

    let(:expected_output) do
      <<~HTML
        Entries by total views:
        /contact-us 140 visits
        /about 100 visits
        /home 25 visits

        Entries by unique views:
        /home 10 unique visits
        /about 5 unique visits
        /contact-us 2 unique visits
      HTML
    end

    it { is_expected.to eql(expected_output) }
  end
end
