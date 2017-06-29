class GameView

  attr_reader :guessed_letters

  def initialize io_handler, prompter
    @io_handler = io_handler
    @prompter = prompter
    @guesses = "Your guesses are:  "
    @hangman_body = [display_hangman_head, display_hangman_upper_torso, 
                  display_hangman_arms, display_hangman_lower_torso, 
                  display_hangman_legs, display_hangman_feet]
  end

  def get_prompt prompt
    @io_handler.print(@prompter.get_prompt(prompt))
  end

  def print_word word
    @io_handler.print(word)
  end

  def get_input
    @io_handler.get_input
  end

  def blank_word word
    word = word.gsub(/[A-Z]/, "_ ")
    @io_handler.print(word)
  end

  def swap_letters_by_case word, guess
    if guess.match(/\b[A-Za-z]\b/)
      word = word.gsub(guess.upcase, guess)
    else
      word
    end
  end

  def get_guesses guess
    @guesses = @guesses.concat("#{guess} ")
    @io_handler.print(@guesses)
  end

  def clear_view
    system "clear"
  end

  def display_hangman_head
    "      _____\n" + 
    "     ( * * )\n" +  
    "      (___)"
  end

  def display_hangman_upper_torso
    "        |\n" + 
    "        |\n" 
  end

  def display_hangman_arms
    "    \\___|___/"
  end

  def display_hangman_lower_torso
    "        |\n" + 
    "        |\n" 
  end

  def display_hangman_legs
    "       / \\\n" + 
    "      /   \\\n" + 
    "     /     \\"
  end

  def display_hangman_feet
    "   __|     |__"
  end

  def get_hangman_body 
    @io_handler.print(@hangman_body)
  end

  def get_current_hangman_view_correct word, guess
    clear_view
    get_prompt("prompt_correct_guess")
    @io_handler.print(@hangman_body)
    get_guesses(guess)
    swap_letters_by_case(word, guess)
  end

  def get_current_hangman_view_incorrect guess
    clear_view
    get_prompt("prompt_incorrect_guess")
    @hangman_body.pop
    @io_handler.print(@hangman_body)
    get_guesses(guess)
  end

end
