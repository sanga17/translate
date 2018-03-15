require_relative 'word_changes'
GLOSARY_FILE = "glosary.txt"
class LineChanges

  def initialize(line)
    @line = line
  end

  def last_word_correction
    word_array = @line.split(' ')
    word_array.each_with_index do |word , index|
      word_object = WordChanges.new(word)
      word = word_object.remove_special_character
      word = word_object.last_word_remover
      word_array[index] = word
    end
    @line = word_array.reject(&:empty?).join(' ')
    puts @line
  end

  def line_replace_with
    line_converted = ''
    glosary = File.read(GLOSARY_FILE)
    glosary.each_line do |line1|
      line1 = line1.chomp
      hash = Hash[*line1.split(" ")]
      hash.each do |key,value|
        if @line.include? key
          line_converted = @line.gsub!(key,value)
        end
      end
    end
    line_converted
  end

end