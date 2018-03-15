class WordChanges

  def initialize(word)
    @word = word
  end

  def remove_special_character
    if @word.include? "'"
       @word = @word.gsub("'" , "")
    end
  end

  def last_word_remover
    if @word[-1,1] == 'a' || @word[-1,1] == 'ṁ'
      @word = @word.chop
    elsif @word[-1,1] == "," && @word[-2,1] == "a"
      @word = @word.gsub("a," , ",")
    elsif  @word[-1,1] == "." && @word[-2,1] == "a"
      @word = @word.gsub("a." , ".")
    elsif  @word[-1,1] == ":" && @word[-2,1] == "a"
      @word = @word.gsub("a:" , ":")
    end
    @word
  end

end