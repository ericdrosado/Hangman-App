require_relative '../game'
require_relative '../game_view'
require_relative '../validator'
require_relative 'mocks/mock_io_handler'

describe 'Game' do

  game_view = GameView.new
  mock_io_handler = MockIOHandler.new
  prompter = Prompter.new
  validator = Validator.new
  game = Game.new(game_view, mock_io_handler, prompter, validator)

  describe '#game_handler' do

    before do
      mock_io_handler.get_input.stub(:upcase)
      validator.stub(:is_a_word?)
    end

    after { game.game_handler }

    it 'will receive printer from mock_io_handler' do
      expect(mock_io_handler).to receive(:printer).exactly(2).times
    end

    it 'will receive game_greeting from prompter' do
      expect(prompter).to receive :game_greeting
    end

    it 'will receive prompt_for_word from prompter' do
      expect(prompter).to receive :prompt_for_word
    end

    it 'will receive is_a_word from validator' do
      expect(validator).to receive :is_a_word?
    end

  end

end