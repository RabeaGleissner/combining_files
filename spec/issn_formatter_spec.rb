require "issn_formatter"

describe IssnFormatter do
  it "adds hyphen if it is missing" do
    formatted = IssnFormatter.format("12341234")

    expect(formatted).to eq("1234-1234")
  end

  it "keeps ISSN the same if the format is correct" do
    formatted = IssnFormatter.format("2222-3333")

    expect(formatted).to eq("2222-3333")
  end
end
