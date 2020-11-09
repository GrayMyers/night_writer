require './lib/character'
class Text
  attr_reader :original, :characters
  def initialize(string)
    @original = string
    @characters = make_characters(string)
  end

  def make_characters(string)
    string.split("").map do |char|
      Character.from_english(char)
    end
  end

  def braille_text
    top = ""
    mid = ""
    bot = ""
    @characters.each do |character|
      top << character.braille_top
      mid << character.braille_mid
      bot << character.braille_bot
    end
    top + "\n" + mid + "\n" + bot
  end
end
