require "input_validator"

describe InputValidator do
  describe "file to combine" do
    it "returns true when all three files exist in the resources directory" do
      files = ["journals.csv", "articles.csv", "authors.json"]
      expect(InputValidator.files_valid?(files)).to be(true)
    end

    it "returns false when one of the files does not exist in the resources directory" do
      files = ["something.csv", "articles.csv", "authors.json"]
      expect(InputValidator.files_valid?(files)).to be(false)
    end

    it "returns false when not exactly three files are give" do
      files = ["articles.csv", "authors.json"]
      expect(InputValidator.files_valid?(files)).to be(false)
    end
  end

  describe "output format" do
    it "is valid when given format is csv" do
      expect(InputValidator.output_format_valid?("csv")).to be(true)
    end

    it "is valid when given format is json" do
      expect(InputValidator.output_format_valid?("json")).to be(true)
    end

    it "is invalid when given format is not csv or json" do
      expect(InputValidator.output_format_valid?("html")).to be(false)
    end
  end
end
