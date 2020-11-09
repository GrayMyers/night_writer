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
    top, mid, bot = "","",""
    @characters.each do |character|
      top << character.braille_top
      mid << character.braille_mid
      bot << character.braille_bot
    end
    top_arr, mid_arr, bot_arr = truncate(top,mid,bot)
    collector = ""
    top_arr.length.times do |i|
      collector << top_arr[i] + "\n" + mid_arr[i] + "\n" + bot_arr[i] + "\n"
    end
    collector.chomp
  end

  def truncate(top,mid,bot)
    max_length = 80
    top_arr = [top[0..max_length - 1]]
    mid_arr = [mid[0..max_length - 1]]
    bot_arr = [bot[0..max_length - 1]]
    (top.length/max_length).floor.times do |i|
      start = max_length*(i+1)
      finish = max_length*(i+2) - 1
      top_arr << top[start..finish]
      mid_arr << mid[start..finish]
      bot_arr << bot[start..finish]
    end
    return top_arr, mid_arr, bot_arr
  end
end
