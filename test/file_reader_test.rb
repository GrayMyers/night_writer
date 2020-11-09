require "./test/test_helper"

class FileReaderTest < Minitest::Test
  def setup
    @file_reader = FileReader.new("message.txt")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of FileReader, @file_reader

    assert_equal "message.txt", @file_reader.file_to_read
  end

  def test_it_can_read_file
    expected_arr = "hello world"
    assert_equal expected_arr, @file_reader.read
  end
end
