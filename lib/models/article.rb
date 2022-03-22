require "issn_formatter"

class Article
  attr_reader :doi, :title, :issn

  def initialize(doi, title, issn)
    @doi = doi
    @title = title
    @issn = IssnFormatter.format(issn)
  end
end
