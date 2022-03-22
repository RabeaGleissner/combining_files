require_relative "combiner"
require_relative "converter"
require_relative "file_readers/csv_file_reader"
require_relative "file_readers/json_file_reader"
require_relative "models/article"
require_relative "models/journal"
require_relative "models/author"

class Program
  def self.run(output_file_format)
    articles = CsvFileReader.read_and_create("resources/articles.csv", Article)
    journals = CsvFileReader.read_and_create("resources/journals.csv", Journal)
    authors = JsonFileReader.read_and_create("resources/authors.json", Author)

    combinations = Combiner.combine(articles, journals, authors)
    converter = Converter.new(output_file_format)
    converter.convert(combinations)
  end
end
