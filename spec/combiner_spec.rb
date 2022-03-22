require "combiner"

describe Combiner do
  it "combines articles, authors and journals" do
    articles = [
      Article.new("doi1", "article title 1", "1111-1111"),
      Article.new("doi2", "article title 2", "2222-2222"),
      Article.new("doi3", "article title 3", "3333-3333")
    ]

    journals = [
      Journal.new("journal title 1", "1111-1111"),
      Journal.new("journal title 2", "2222-2222"),
      Journal.new("journal title 3", "3333-3333")
    ]

    authors = [
      Author.new("author name 1", "doi1"),
      Author.new("author name 2", "doi2"),
      Author.new("author name 3", "doi3")
    ]

    combination = Combiner.combine(articles, journals, authors)

    expect(combination.length).to eq(3)
    expect(combination.first).to have_attributes(
      doi: "doi1",
      article_title: "article title 1",
      issn: "1111-1111",
      author_name: "author name 1",
      journal_title: "journal title 1"
    )
    expect(combination[1]).to have_attributes(
      doi: "doi2",
      article_title: "article title 2",
      issn: "2222-2222",
      author_name: "author name 2",
      journal_title: "journal title 2"
    )
    expect(combination.last).to have_attributes(
      doi: "doi3",
      article_title: "article title 3",
      issn: "3333-3333",
      author_name: "author name 3",
      journal_title: "journal title 3"
    )
  end

  it "leaves any fields blank that can't be identified" do
    articles = [
      Article.new("doi1", "article title 1", "1111-1111"),
      Article.new("doi3", "article title 3", "3333-3333")
    ]

    journals = [
      Journal.new("journal title 2", "2222-2222"),
      Journal.new("journal title 3", "3333-3333")
    ]

    authors = [
      Author.new("author name 1", "doi1"),
      Author.new("author name 2", "doi2")
    ]

    combination = Combiner.combine(articles, journals, authors)

    expect(combination.length).to eq(2)
    expect(combination.first).to have_attributes(
      doi: "doi1",
      article_title: "article title 1",
      issn: "1111-1111",
      author_name: "author name 1",
      journal_title: ""
    )
    expect(combination.last).to have_attributes(
      doi: "doi3",
      article_title: "article title 3",
      issn: "3333-3333",
      author_name: "",
      journal_title: "journal title 3"
    )
  end
end
