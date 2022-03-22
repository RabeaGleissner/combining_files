require "models/combination"

describe Combination do
  it "converts the object to a hash" do
    combination = Combination.new("doi", "title", "issn", "author name", "journal title")

    expect(combination.to_h).to eq(
      {
        doi: "doi",
        article_title: "title",
        issn: "issn",
        author_name: "author name",
        journal_title: "journal title"
      }
    )
  end
end
