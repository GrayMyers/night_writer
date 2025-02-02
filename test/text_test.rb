require "./test/test_helper.rb"

class TextTest < Minitest::Test
  def setup
    @char = mock()
    @char.stubs("character").returns("h")
    @char.stubs("braille_top").returns("..")
    @char.stubs("braille_mid").returns("00")
    @char.stubs("braille_bot").returns("..")
    Character.stubs("from_english").returns(@char)
    Character.stubs("from_braille").returns(@char)
    @text = Text.from_english("hello")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Text, @text

    assert_equal "hello", @text.original
    assert_equal ([@char,@char,@char,@char,@char]), @text.characters
  end

  def test_it_initializes_from_braille
    text_2 = Text.from_braille("0000000000\n..........\n0000000000")
    assert_instance_of Text, @text

    assert_equal "hello", @text.original
    assert_equal ([@char,@char,@char,@char,@char]), @text.characters
  end

  def test_it_makes_characters_from_english
    assert_equal ([@char,@char,@char,@char,@char]), @text.characters_from_english("hello")
  end

  def test_it_makes_characters_from_braille
    assert_equal ([@char,@char,@char,@char,@char]), @text.characters_from_braille("0000000000\n..........\n0000000000")
  end

  def test_it_returns_braille_text
    expected = "..........\n0000000000\n.........."
    assert_equal expected, @text.braille_text

    text2 = Text.from_english("a"*50) #test for truncation edge case
    long_dot = "."*80
    long_0 = "0"*80
    short_dot = "."*20
    short_0 = "0"*20
    expected_2 = long_dot+"\n"+long_0+"\n"+long_dot+"\n"+short_dot+"\n"+short_0+"\n"+short_dot
    assert_equal expected_2, text2.braille_text
  end

  def test_it_returns_english_text
    expected = "hhhhh"
    assert_equal expected, @text.english_text
    long_braille = "." * 200 + "\n" + "0" * 200 + "\n" + "." * 200
    text2 = Text.from_braille(long_braille)
    expected_2 = "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh\nhhhhhhhhhhhhhhhhhhhh"
    assert_equal expected_2, text2.english_text
  end

  def test_it_truncates
    too_long = "."*165
    expected_str = "."*80
    expected_leftover = "."*5
    expected_arr = [[expected_str,expected_str,expected_leftover],
                    [expected_str,expected_str,expected_leftover],
                    [expected_str,expected_str,expected_leftover]
                  ]
    assert_equal expected_arr, @text.truncate_braille(too_long,too_long,too_long)
  end
end
