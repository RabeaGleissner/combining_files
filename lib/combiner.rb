require_relative "models/combination"

class Combiner
  def self.combine(articles, journals, authors)
    articles.map do |article|
      Combination.new(
        article.doi,
        article.title,
        article.issn,
        find_author_name(article, authors),
        find_journal_title(article, journals)
      )
    end
  end

  def self.find_author_name(article, authors)
    authors.find { |author| author.articles.include?(article.doi) }&.name || ""
  end

  def self.find_journal_title(article, journals)
    journals.find { |journal| journal.issn == article.issn }&.title || ""
  end
end
