require "converter"
require "models/combination"

describe Converter do
  let(:input) do
    [Combination.new("doi1", "article title 1", "1111-1111", "author name 1", "journal title 1")]
  end

  it "converts to json" do
    converter = Converter.new("json")

    output = converter.convert(input)

    # rubocop:disable Layout/LineLength
    expect(output).to eq("[{\"doi\":\"doi1\",\"article_title\":\"article title 1\",\"issn\":\"1111-1111\",\"author_name\":\"author name 1\",\"journal_title\":\"journal title 1\"}]")
    # rubocop:enable Layout/LineLength
  end

  it "converts to csv" do
    converter = Converter.new("csv")

    output = converter.convert(input)

    # rubocop:disable Layout/LineLength
    expect(output).to eq("DOI,Article title,Journal ISSN,Author name,Journal title\ndoi1,article title 1,1111-1111,author name 1,journal title 1\n")
    # rubocop:enable Layout/LineLength
  end
end
