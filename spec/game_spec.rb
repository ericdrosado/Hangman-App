require_relative '../game'
require_relative '../game_view'
require_relative '../validator'
require_relative 'mocks/mock_io_handler'

describe 'Game' do

  game_view = GameView.new
  mock_io_handler = MockIOHandler.new
  prompter = Prompter.new
  validator = Validator.new(prompter, mock_io_handler)
  game = Game.new(game_view, mock_io_handler, prompter, validator)

  describe '#game_handler' do

    before do
      mock_io_handler.get_input.stub(:upcase)
      mock_io_handler.get_input.stub(:downcase)
      validator.stub(:validate_selection)
      game_view.stub(:word_blank)
      game_view.stub(:guessed_letters_view)
      game_view.stub(:letter_swap)
      game_view.stub(:clear_view)
    end

    after { game.play_game }

    it 'will receive printer from mock_io_handler' do
      expect(mock_io_handler).to receive(:printer).at_least(:once)
    end

    it 'will receive game_greeting from prompter' do
      expect(prompter).to receive :game_greeting
    end

    it 'will receive prompt_for_word from prompter' do
      expect(prompter).to receive(:prompt_for_word).at_least(:once)
    end

    it 'will receive validate_selection from validator' do
      expect(validator).to receive :validate_selection
    end

    it 'will receive clear_view from game_view' do
      expect(game_view).to receive :clear_view
    end

    it 'will receive guessed_letters_view from game_view' do
      expect(game_view).to receive :guessed_letters_view
    end

    it 'will receive letter_swap from game_view' do
      expect(game_view).to receive :letter_swap
    end

    it 'will receive guessed_letters from game_view' do
      expect(game_view).to receive :guessed_letters
    end

  end

end