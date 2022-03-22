require "csv"

class CsvFileReader
  def self.read_and_create(file_path, model)
    csv_data = CSV.read(file_path)
    csv_data.shift
    csv_data.map do |data|
      model.new(*data)
    end
  end
end
