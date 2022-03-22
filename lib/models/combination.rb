class Combination
  attr_reader :doi, :article_title, :author_name, :journal_title, :issn


  def initialize(doi, article_title, issn, author_name, journal_title)
    @doi = doi
    @article_title = article_title
    @issn = issn
    @author_name = author_name
    @journal_title = journal_title
  end
end
