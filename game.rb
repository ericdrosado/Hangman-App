require_relative 'prompter'
require_relative 'io_handler'

class Game

  def initialize io, prompter
    @io = io
    @prompter = prompter
  end

  def game_handler
    @io.printer(@prompter.game_greeting)
    @io.printer(@prompter.prompt_for_word)
    @io.printer(@io.word_blank(@io.get_input))
  end
  
end

