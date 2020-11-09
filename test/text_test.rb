require "./test/test_helper.rb"

class TextTest < Minitest::Test
  def setup
    @char = mock()
    @char.stubs("character").returns("h")
    Character.stubs("from_english").returns(@char)
    @text = Text.new("hello")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Text, @text

    assert_equal "hello", @text.original
    assert_equal ([@char,@char,@char,@char,@char]), @text.characters
  end

  def test_it_makes_characters
    assert_equal ([@char,@char,@char,@char,@char]), @text.make_characters("hello")
  end
end
