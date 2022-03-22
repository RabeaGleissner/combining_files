require "issn_formatter"

class Journal
  attr_reader :title, :issn

  def initialize(title, issn)
    @title = title
    @issn = IssnFormatter.format(issn)
  end
end
