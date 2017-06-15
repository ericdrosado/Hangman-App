require_relative 'game'
require_relative 'game_view'
require_relative 'io_handler'
require_relative 'prompter'
require_relative 'validator'

game_view = GameView.new
io_handler = IOHandler.new
prompter = Prompter.new
validator = Validator.new(prompter, io_handler)
game = Game.new(game_view, io_handler, prompter, validator)
game.play_game