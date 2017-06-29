class Validator

  def initialize
    @incorrect_guess_counter = 0
  end

  def validate_word word
    is_a_word?(word)
  end

  def validate_guess guess
    is_a_word?(guess) || is_a_letter?(guess)
  end

  def is_guess_correct? word, guess
    if guess.match(/\b[a-z]\b/)
      is_letter_present_in_word?(word, guess)
    else
      correct_word?(word, guess)
    end
  end

  def is_a_word? word 
    !! word.match(/^[a-zA-Z]+$/) && word.length > 1
  end

  def is_a_letter? letter 
    !! letter.match(/^[a-zA-Z]+$/) && letter.length < 2
  end

  def is_letter_present_in_word? word, letter
    word.each_char do |char|
      if char == letter.upcase
        return true
      end
    end
    @incorrect_guess_counter += 1
    false
  end

  def correct_word? word, guess
    if word.upcase == guess.upcase
      return true
    else
      @incorrect_guess_counter += 1
      false
    end
  end

  def end_of_game? word, guess
    word_match?(word, guess) || all_downcase?(word) || @incorrect_guess_counter == 6
  end

  def word_match? word, guess
    word.upcase == guess.upcase
  end

  def all_downcase? word
    !! word.match(/^[a-z]+$/)
  end

  def validate_win_or_loss
    if @incorrect_guess_counter == 6
      return "prompt_you_lose"
    else
      return "prompt_you_win"
    end
  end

end