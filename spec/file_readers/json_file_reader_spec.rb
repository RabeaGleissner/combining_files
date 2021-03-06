require "json"
require "file_readers/json_file_reader"
require "models/author"

describe JsonFileReader do
  let(:file_path) { "test.json" }
  after(:each) { File.delete(file_path) }

  def create_test_json(data)
    File.open(file_path, "w") do |f|
      f.write(data.to_json)
    end
  end

  it "converts json data into an array of authors" do
    data = [
      { name: "Name 1", articles: ["doi1"] },
      { name: "Name 2", articles: ["doi2"] }
    ]
    create_test_json(data)

    authors = JsonFileReader.read_and_create(file_path, Author)

    expect(authors.length).to eq(2)
    expect(authors.first.name).to eq("Name 1")
    expect(authors.first.articles).to eq(["doi1"])
    expect(authors.last.name).to eq("Name 2")
    expect(authors.last.articles).to eq(["doi2"])
  end
end
