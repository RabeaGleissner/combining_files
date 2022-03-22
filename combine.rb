require_relative "lib/args_parser"
require_relative "lib/input_validator"
require_relative "lib/program"

parser = ArgsParser.new(ARGV)

unless InputValidator.files_valid?(parser.files_to_combine)
  puts "Sorry, your file selection does not match up with the available files. Please double-check your command."
  exit
end

output_format = parser.output_file_format

unless InputValidator.output_format_valid?(output_format)
  puts "Sorry, your requested output format is not available. We can only create csv or json data."
  exit
end

puts Program.run(output_format)
