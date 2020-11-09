require "./test/test_helper"

class FileReaderTest < Minitest::Test
  def setup
    lines_arr = ["This\n","is\n","a\n","message!"]
    
    file_obj = mock()
    file_obj.stubs("readlines").returns(lines_arr)

    File.stubs("new").returns(file_obj)

    @file_reader = FileReader.new("message.txt")

  end

  def test_it_exists_and_has_attributes
    assert_instance_of FileReader, @file_reader

    assert_equal "message.txt", @file_reader.file_to_read
  end

  def test_it_can_read_file
    expected_arr = "This is a message!"
    assert_equal expected_arr, @file_reader.read
  end
end
