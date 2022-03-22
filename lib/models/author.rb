class Author
  attr_reader :name, :doi

  def initialize(name, doi)
    @name = name
    @doi = doi
  end
end
