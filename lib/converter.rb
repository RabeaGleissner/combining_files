class Converter
  def initialize(data_type)
    @data_type = data_type
  end

  def convert(combinations)
    hash_array = combinations.map(&:to_h)
    if data_type == "json"
      JSON.generate(hash_array)
    else
      convert_to_csv(hash_array)
    end
  end

  private

  attr_reader :data_type

  def convert_to_csv(data)
    CSV.generate do |csv|
      csv << Combination::KEYS_WITH_HEADERS.values
      data.each do |row|
        csv << Combination::KEYS_WITH_HEADERS.keys.map { |key| row[key] }
      end
    end
  end
end
