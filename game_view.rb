class GameView

  attr_reader :guessed_letters, :body_array

  def initialize
    @guessed_letters = "Your guessed letters are:  "
    @body_array = [display_hangman_head, display_hangman_upper_torso, 
                  display_hangman_arms, display_hangman_lower_torso, 
                  display_hangman_legs, display_hangman_feet]
  end

  def blank_word word
    word = word.gsub(/[A-Z]/, "_ ")
  end

  def swap_letters_by_case word, letter
    word = word.gsub(letter.upcase, letter)
  end

  def guessed_letters_view letter
    @guessed_letters = @guessed_letters.concat(letter + " ")
  end

  def clear_view
    system "clear"
  end

  def display_hangman_head
    "      " + "_____\n" + "     " + "( * * )\n" +  "      " + "(___)"
  end

  def display_hangman_upper_torso
    "        " + "|\n" + "        " + "|\n" 
  end

  def display_hangman_arms
    "    " + "\\___" + "|" + "___/"
  end

  def display_hangman_lower_torso
    "        " + "|\n" + "        " + "|\n" 
  end

  def display_hangman_legs
    "       " + "/ \\\n" + "      " + "/   \\\n" + "     " + "/     \\"
  end

  def display_hangman_feet
    "   " + "__|" + "     |__"
  end
  
  def remove_hangman_body_part
    @body_array.pop
    @body_array
  end

end
