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

  describe '#play_game' do

    before do
      mock_io_handler.get_input.stub(:upcase)
      mock_io_handler.get_input.stub(:downcase)
      validator.stub(:validate_selection)
      game_view.stub(:blank_word)
      game_view.stub(:guessed_letters_view)
      game_view.stub(:swap_letters_by_case)
      game_view.stub(:clear_view)
    end

    after { game.play_game }

    it 'will receive print from mock_io_handler' do
      expect(mock_io_handler).to receive(:print).at_least(:once)
    end

    it 'will receive prompt_for_game_greeting from prompter' do
      expect(prompter).to receive :prompt_for_game_greeting
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

    it 'will receive swap_letters_by_case from game_view' do
      expect(game_view).to receive :swap_letters_by_case
    end

    it 'will receive guessed_letters from game_view' do
      expect(game_view).to receive :guessed_letters
    end

    it 'will receive prompt_for_word_guess from prompter' do
      expect(prompter).to receive :prompt_for_word_guess
    end

  end

end