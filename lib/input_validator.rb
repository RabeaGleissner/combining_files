class InputValidator
  def self.files_valid?(files)
    files.length == 3 && files_exist?(files)
  end

  def self.output_format_valid?(format)
    ["csv", "json"].include?(format)
  end

  def self.files_exist?(files)
    files.all? { |file| File.exist?("resources/#{file}") }
  end
end
