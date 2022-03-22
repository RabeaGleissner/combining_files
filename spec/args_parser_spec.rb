require "args_parser"

describe ArgsParser do
  it "finds output file format in first position" do
    parser = ArgsParser.new(["--format", "json", "journals.csv", "articles.csv", "authors.json"])

    expect(parser.output_file_format).to eq("json")
  end

  it "finds output file format in last position" do
    parser = ArgsParser.new(["journals.csv", "articles.csv", "authors.json", "--format", "csv"])

    expect(parser.output_file_format).to eq("csv")
  end

  it "returns files to combine" do
    parser = ArgsParser.new(["--format", "json", "journals.csv", "articles.csv", "authors.json"])

    expect(parser.files_to_combine).to eq(["journals.csv", "articles.csv", "authors.json"])
  end

  it "returns files to combine" do
    parser = ArgsParser.new(["file1", "file2", "file3", "--format", "csv"])

    expect(parser.files_to_combine).to eq(["file1", "file2", "file3"])
  end
end
