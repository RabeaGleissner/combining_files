class Author
  attr_reader :name, :articles

  def initialize(name, articles)
    @name = name
    @articles = articles
  end
end
