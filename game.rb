require_relative 'prompter'
require_relative 'io_handler'

class Game

  attr_reader :word, :letter

  def initialize game_view, io_handler, prompter, validator
    @game_view = game_view
    @io_handler = io_handler
    @prompter = prompter
    @validator = validator
  end

  def game_handler
    @io_handler.printer(@prompter.game_greeting)
    @io_handler.printer(@prompter.prompt_for_word)
    while @validator.is_a_word?(@word=(@io_handler.get_input.upcase)) == false
      @io_handler.printer(@prompter.prompt_for_word)
    end
    system "clear"
    @io_handler.printer(@prompter.prompt_for_letter)
    @io_handler.printer(@game_view.word_blank(@word))
    
      while @validator.is_a_letter?(@letter=(@io_handler.get_input.downcase)) == false
        @io_handler.printer(@prompter.prompt_for_word)
      end
      @game_view.guessed_letters_view(@letter)
      @io_handler.printer(@game_view.word_blank(@game_view.letter_swap(@word, @letter)))
      @io_handler.printer(@game_view.guessed_letters)
      @io_handler.printer(@prompter.prompt_for_word_guess)
    
  end
  
end

