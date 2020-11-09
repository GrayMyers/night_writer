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
end
