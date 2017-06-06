require_relative 'prompter'
require_relative 'io'

class Game

  def initialize prompter, io
    @prompter = prompter
    @io = io
  end

  def game_handler
    @io.printer(@prompter.game_greeting)
  end
  
end

