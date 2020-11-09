class FileWriter
  attr_reader :file_to_write, :chars
  def initialize(filepath)
    @file_to_write = filepath
    @chars = 0
  end

  def write(lines)
    remove_if_exists
    file_obj = File.new(@file_to_write, "w")

    input = lines
    write_to_file(file_obj,input)

    @chars = input.length

    file_obj.close
  end

  def write_to_file(file_obj,input_string)
    file_obj.puts(input_string)
  end

  def remove_if_exists
    File.delete(@file_to_write) if File.file?(@file_to_write)
  end
end
