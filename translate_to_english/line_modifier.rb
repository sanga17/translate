require_relative 'word_changes'
GLOSARY_FILE = "glosary.txt"
class LineModifier

  def initialize(line)
    @line = line
  end

  def last_word_correction
    word_array = @line.split(' ')
    word_array.each_with_index do |word , index|
      word_modifier = WordModifier.new(word)
      word = word_modifier.word_operations
      word_array[index] = word
    end
    @line = word_array.reject(&:empty?).join(' ')
  end

  def line_replace_with
    line_converted = ''
    glosary = File.read(GLOSARY_FILE)
    glosary.each_line do |glosary_line|
      glosary_line = glosary_line.chomp
      hash = Hash[*glosary_line.split(" ")]
      hash.each do |key,value|
        if @line.include? key
          @line = @line.gsub!(key,value)
        end
      end
    end
    @line
  end

  def line_operations
    line_modifier.last_word_correction
    line_modifier.line_replace_with
  end

end