class Validator

  def initialize prompter, io_handler
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

  def correct_word? word, word_guess
    word.upcase == word_guess.upcase
  end

  def all_downcase? word
    !! word.match(/^[a-z]+$/)
  end

  def end_of_game? word, word_guess, counter
    correct_word?(word, word_guess) || all_downcase?(word) || counter == 6
  end

  def validate_win_or_loss counter
    if counter == 6
      @prompter.prompt_you_lose
    else
      @prompter.prompt_you_win
    end
  end

end