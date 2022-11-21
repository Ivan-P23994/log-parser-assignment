# frozen_string_literal: true

RSpec.describe LogParser::Grouper do
  let(:grouper) { described_class.new(lines) }
  let(:lines) do
    [
      LogParser::Line.new("/about", "1.2.2.2"),
      LogParser::Line.new("/about", "1.2.2.2"),
      LogParser::Line.new("/about", "2.2.2.2"),
      LogParser::Line.new("/home", "1.2.2.2"),
      LogParser::Line.new("/home", "1.2.2.2")
    ]
  end

  describe "#group" do
    subject(:group) { grouper.group }

    it "group entries by their path" do
      expect(group.keys).to match_array(["/home", "/about"])
    end

    it "stores total views" do
      expect(group.fetch("/about").total).to eql(3)
    end
  end
end
