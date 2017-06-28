require_relative '../game'
require_relative '../game_view'
require_relative '../validator'
require_relative 'mocks/mock_io_handler'

describe 'Game' do

  game_view = GameView.new
  mock_io_handler = MockIOHandler.new
  prompter = Prompter.new
  validator = Validator.new(game_view, prompter, mock_io_handler)
  game = Game.new(game_view, mock_io_handler, prompter, validator)

  before do
      mock_io_handler.get_input.stub(:upcase)
      mock_io_handler.get_input.stub(:downcase)
      validator.stub(:is_letter_present_in_word?)
      validator.stub(:validate_selection)
      validator.stub(:validate_guess)
      validator.stub(:is_guess_correct?)
      validator.stub(:validate_guess_for_body_part_removal)
      game_view.stub(:blank_word)
      game_view.stub(:guessed_letters_view)
      game_view.stub(:swap_letters_by_case)
      game_view.stub(:clear_view)
    end

  describe '#play_game' do

    after { game.play_game }

    it 'will receive prompt_for_game_greeting from prompter' do
      expect(prompter).to receive :prompt_for_game_greeting
    end

    it 'will receive print from mock_io_handler' do
      expect(mock_io_handler).to receive(:print).at_least(:once)
    end

    it 'will receive player_one_pick_word from game' do
      expect(game).to receive(:player_one_pick_word)
    end

    it 'will receive clear_view from game_view' do
      expect(game_view).to receive :clear_view
    end

    it 'will receive blank_word from game_view' do
      expect(game_view).to receive :blank_word
    end

    it 'will receive player_one_pick_word from game' do
      expect(game).to receive(:player_two_guess_word)
    end

  end

  describe '#player_one_pick_word' do

    after { game.player_one_pick_word }

    it 'will receive print from mock_io_handler' do
      expect(mock_io_handler).to receive(:print).at_least(:once)
    end

    it 'will receive prompt_for_word from prompter' do
      expect(prompter).to receive(:prompt_for_word).at_least(:once)
    end

    it 'will receive validate_selection from validator' do
      expect(validator).to receive :validate_selection
    end

    it 'will return an upcase word' do
      expect(validator).to receive(:validate_selection).and_return("TEST")
      expect(game.player_one_pick_word).to eq "TEST"
    end

  end

  describe '#player_two_guess_word' do

    after { game.player_two_guess_word("test") }

    it 'will receive print from mock_io_handler' do
      expect(mock_io_handler).to receive(:print).at_least(:once)
    end

    it 'will receive guessed_letters_view from game_view' do
      expect(game_view).to receive :guessed_letters_view
    end

    it 'will receive swap_letters_by_case from game_view' do
      expect(game_view).to receive :swap_letters_by_case
    end

    it 'will receive blank_word from game_view' do
      expect(game_view).to receive :blank_word
    end

    it 'will receive guessed_letters from game_view' do
      expect(game_view).to receive :guessed_letters
    end

    it 'will receive prompt_for_word_guess from prompter' do
      expect(prompter).to receive :prompt_for_guess
    end

    it 'will return "You win!" if player two wins' do
      expect(game).to receive(:player_two_guess_word).and_return(prompter.prompt_you_win).at_least(:once)
      expect(game.player_two_guess_word("test")).to eq "You win!"
    end

    it 'will return "You lose!" if player two loses' do
      word = 'test'
      expect(game).to receive(:player_two_guess_word).and_return(prompter.prompt_you_lose(word)).at_least(:once)
      expect(game.player_two_guess_word("test")).to eq "You lose! The correct word was: test"
    end

  end

end