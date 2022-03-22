class Converter
  def initialize(data_type)
    @data_type = data_type
  end

  def convert(combinations)
    if data_type == "json"
      JSON.generate(combinations.map(&:to_h))
    else
      convert_to_csv(combinations.map(&:to_h))
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
