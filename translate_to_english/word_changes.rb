class WordChanges

  def initialize(word)
    @word = word
  end

  def last_word_remover
    if @word[-1,1] == 'a'
      @word = @word.chop
    elsif @word[-1,1] == "," && @word[-2,1] == "a"
      @word = @word.gsub("a," , ",")
    end
  end
end