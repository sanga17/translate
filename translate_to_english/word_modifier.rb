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
    if last == 'a' || last == 'ṁ'
      @word = @word.chop
    elsif second_last_character_remover(",","a")
    elsif second_last_character_remover(".","a")
    elsif second_last_character_remover(":","a")
    end
    @word
  end

  def word_operations
    remove_special_character
    last_word_remover
  end

  def second_last_character_remover(last_character,second_last_character)
    if last == last_character && @word[-2,1] == second_last_character
      @word = @word.gsub(second_last_character.concat(last_character) , last_character)
    end
  end

  def last
    @word[-1]
  end

end