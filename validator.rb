class Validator

  def is_a_word? word 
    if word.match(/^[a-zA-Z]+$/) && word.length > 1
      true
    else
      false
    end
  end

  def is_a_letter? letter 
    if letter.match(/^[a-zA-Z]+$/) && letter.length < 2
      true
    else
      false
    end
  end

  def correct_word? word, word_guess
    word == word_guess
  end

  def has_blanks? word
    word.include? "_"
  end

end