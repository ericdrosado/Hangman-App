class Validator

  def initialize game_view, prompter, io_handler
    @game_view = game_view
    @prompter = prompter
    @io_handler = io_handler
  end

  def is_a_word? word 
    !! word.match(/^[a-zA-Z]+$/) && word.length > 1
  end

  def is_a_letter? letter 
    !! letter.match(/^[a-zA-Z]+$/) && letter.length < 2
  end

  def validate_selection prompt, validation_type
    while ! public_send(validation_type, type = @io_handler.get_input)
      @io_handler.print(prompt)
    end
    type
  end

  def is_letter_present_in_word? word, letter
    word.each_char do |char|
      if char == letter.upcase
        return true
      end
    end
    false
  end

  def is_guess_correct? boolean
    if boolean
      @prompter.prompt_correct_guess
    else
      @prompter.prompt_incorrect_guess
    end
  end

  def validate_body_part_removal boolean
    if boolean
      @game_view.body_array
    else
      @game_view.remove_hangman_body_part
    end
  end

  def correct_word? word, word_guess
    word.upcase == word_guess.upcase
  end

  def validate_word_guess word, word_guess
    if word_guess == ""
      return true
    else
      correct_word?(word, word_guess)
    end
  end

  def validate_word_guess_for_body_part_removal word, word_guess
    if word_guess == ""
      validate_body_part_removal(true)
    else 
      validate_body_part_removal(correct_word?(word, word_guess))
    end
  end

  def all_downcase? word
    !! word.match(/^[a-z]+$/)
  end

  def validate_guess_counter_count boolean, guess_counter
    if boolean
      guess_counter
    else
      guess_counter += 1
    end
  end

  def end_of_game? word, word_guess, guess_counter
    correct_word?(word, word_guess) || all_downcase?(word) || guess_counter == 6
  end

  def validate_win_or_loss guess_counter
    if guess_counter == 6
      @prompter.prompt_you_lose
    else
      @prompter.prompt_you_win
    end
  end

end