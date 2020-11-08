require "./test/test_helper"

class FileReaderTest < Minitest::Test
  def setup
    @file_reader = FileReader.new("message.txt")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of FileReader, @file_reader

    assert_equal "message.txt", @file_reader.read_file
  end
end
