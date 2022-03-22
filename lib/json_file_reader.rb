require "json"

class JsonFileReader
  def self.read_and_create(file_path, model)
    json_data = JSON.parse(File.read(file_path))
    json_data.map do |data|
      model.new(*data.values)
    end
  end
end
