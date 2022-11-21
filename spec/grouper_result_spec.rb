# frozen_string_literal: true

RSpec.describe LogParser::GroupedResults do
  let(:result) { described_class[grouped_lines] }
  let(:grouped_lines) do
    {
      "/about" => counter1,
      "/home" => counter2,
      "/contact-us" => counter3
    }
  end
  let(:counter1) { instance_double(LogParser::Counter, unique: 5, total: 5) }
  let(:counter2) { instance_double(LogParser::Counter, unique: 10, total: 25) }
  let(:counter3) { instance_double(LogParser::Counter, unique: 2, total: 150) }

  describe "#sort_by_total" do
    subject { result.sort_by_total }

    let(:expected_sorted_lines) do
      [
        ["/contact-us", counter3],
        ["/home", counter2],
        ["/about", counter1]
      ]
    end

    it { is_expected.to eql(expected_sorted_lines) }
  end

  describe "#sort_by_unique" do
    subject { result.sort_by_unique }

    let(:expected_sorted_lines) do
      [
        ["/home", counter2],
        ["/about", counter1],
        ["/contact-us", counter3]
      ]
    end

    it { is_expected.to eql(expected_sorted_lines) }
  end
end
