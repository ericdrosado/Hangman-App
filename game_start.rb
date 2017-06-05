require_relative 'game'
require_relative 'prompter'
require_relative 'view'

view = View.new
prompter = Prompter.new
game = Game.new(prompter, view)
game.game_handler