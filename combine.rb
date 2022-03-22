require_relative "lib/args_parser"
require_relative "lib/input_file_validator"
require_relative "lib/csv_file_reader"
require_relative "lib/program"

parser = ArgsParser.new(ARGV)

unless InputFileValidator.files_valid?(parser.files_to_combine)
  puts ">> Sorry, your file selection does not match up with the available files.
  Please double-check your command and only use available files."
end

puts Program.run(parser.output_file_format)
