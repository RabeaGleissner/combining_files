require "input_file_validator"

describe InputFileValidator do
  describe "valid file input" do
    it "returns true when all three files exist in the resources directory" do
      files = ["journals.csv", "articles.csv", "authors.json"]
      expect(InputFileValidator.files_valid?(files)).to be(true)
    end
  end

  describe "invalid file input" do
    it "returns false when one of the files does not exist in the resources directory" do
      files = ["something.csv", "articles.csv", "authors.json"]
      expect(InputFileValidator.files_valid?(files)).to be(false)
    end

    it "returns false when not exactly three files are give" do
      files = ["articles.csv", "authors.json"]
      expect(InputFileValidator.files_valid?(files)).to be(false)
    end
  end
end
