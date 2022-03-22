require "csv_file_reader"
require "models/article"
require "models/journal"

describe CsvFileReader do
  let(:file_path) { "test.csv" }
  after(:each) { File.delete(file_path) }

  def create_test_csv(rows)
    CSV.open(file_path, "w") do |csv|
      rows.each do |row|
        csv << row
      end
    end
  end

  it "converts csv data into an array of articles" do
    rows = [
      ["DOI", "Title", "ISSN"],
      ["doi1", "title1", "1111-1111"],
      ["doi2", "title2", "2222-2222"]
    ]
    create_test_csv(rows)

    articles = CsvFileReader.read_and_create(file_path, Article)

    expect(articles.length).to eq(2)
    expect(articles.first.doi).to eq("doi1")
    expect(articles.first.title).to eq("title1")
    expect(articles.first.issn).to eq("1111-1111")
    expect(articles.last.doi).to eq("doi2")
    expect(articles.last.title).to eq("title2")
    expect(articles.last.issn).to eq("2222-2222")
  end

  it "converts csv data into array of journals" do
    rows = [
      ["Title", "ISSN"],
      ["title1", "1111-1111"]
    ]
    create_test_csv(rows)

    articles = CsvFileReader.read_and_create(file_path, Journal)

    expect(articles.length).to eq(1)
    expect(articles.first.title).to eq("title1")
    expect(articles.first.issn).to eq("1111-1111")
  end
end
