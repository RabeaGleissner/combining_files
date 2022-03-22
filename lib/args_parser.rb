class ArgsParser
  FORMAT_FLAG = "--format".freeze

  def initialize(arguments)
    @arguments = arguments
  end

  def output_file_format
    arguments[format_flag_index + 1]
  end

  def files_to_combine
    indexes_to_exclude = [format_flag_index, format_flag_index + 1]
    arguments.reject.each_with_index { |_, index| indexes_to_exclude.include?(index) }
  end

  private

  attr_reader :arguments

  def format_flag_index
    @format_flag_index ||= arguments.index(FORMAT_FLAG)
  end
end
