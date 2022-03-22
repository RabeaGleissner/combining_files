class Combination
  attr_reader :doi, :article_title, :author_name, :journal_title, :issn

  KEYS_WITH_HEADERS = {
    doi: 'DOI',
    article_title: 'Article title',
    issn: 'Journal ISSN',
    author_name: 'Author name',
    journal_title: 'Journal title'
  }.freeze

  def initialize(doi, article_title, issn, author_name, journal_title)
    @doi = doi
    @article_title = article_title
    @issn = issn
    @author_name = author_name
    @journal_title = journal_title
  end

  def to_h
    {
      doi: @doi,
      article_title: @article_title,
      issn: @issn,
      author_name: @author_name,
      journal_title: @journal_title
    }
  end
end
