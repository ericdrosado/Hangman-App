require_relative '../validator'
require_relative '../prompter'
require_relative 'mocks/mock_io_handler'

describe 'Validator' do

  game_view = GameView.new
  prompter = Prompter.new
  mock_io_handler = MockIOHandler.new
  validator = Validator.new(game_view, prompter, mock_io_handler)
  
  describe '#is_a_word?' do

    it 'will return true if it is a word' do
      expect(validator.is_a_word?("test")).to be true
    end

    it 'will return false if it is a letter' do
      expect(validator.is_a_word?("t")).to be false
    end

    it 'will return false if it is a word with a non letter' do
      expect(validator.is_a_word?("test!")).to be false
    end

    it 'will return false if given no string' do
      expect(validator.is_a_word?("")).to be false
    end

  end

  describe '#is_a_letter?' do

    it 'will return true if it is a letter' do
      expect(validator.is_a_letter?("t")).to be true
    end

    it 'will return false if given a non alpha' do
      expect(validator.is_a_letter?("!")).to be false
    end

    it 'will return false if given a word' do
      expect(validator.is_a_letter?("test")).to be false
    end

    it 'will return false if given no value' do
      expect(validator.is_a_letter?("")).to be false
    end

  end

  describe '#validate_selection' do

    it 'will return a word if "is_a_word" is passed' do
      expect(mock_io_handler).to receive(:get_input).and_return('test')
      expect(validator.validate_selection(prompter.prompt_for_word, 'is_a_word?')).to eq "test"
    end

    it 'will return a letter if "is_a_letter" is passed' do
      expect(mock_io_handler).to receive(:get_input).and_return('t')
      expect(validator.validate_selection(prompter.prompt_for_letter, 'is_a_letter?')).to eq "t"
    end

    it 'will prompt if not a word and take in a new word' do
      expect(mock_io_handler).to receive(:get_input).and_return('t')
      expect(mock_io_handler).to receive(:print).with('Player 1, please choose a word for Hangman.')
      expect(mock_io_handler).to receive(:get_input).and_return('test')
      expect(validator.validate_selection(prompter.prompt_for_word, 'is_a_word?')).to eq "test"
    end

    it 'will prompt if not a word and take in a new word' do
      expect(mock_io_handler).to receive(:get_input).and_return('test')
      expect(mock_io_handler).to receive(:print).with('Player 2, please choose a letter for Hangman.')
      expect(mock_io_handler).to receive(:get_input).and_return('t')
      expect(validator.validate_selection(prompter.prompt_for_letter, 'is_a_letter?')).to eq "t"
    end

  end

  describe '#is_letter_present_in_word?' do

    it 'will return true if a letter is present' do
      word = "TEST"
      letter = "t"
      expect(validator.is_letter_present_in_word?(word, letter)).to be true
    end

    it 'will return true if a letter is present' do
      word = "TEST"
      letter = "e"
      expect(validator.is_letter_present_in_word?(word, letter)).to be true
    end

    it 'will return false if a letter is not present' do
      word = "TEST"
      letter = "n"
      expect(validator.is_letter_present_in_word?(word, letter)).to be false
    end

    it 'will return false if a letter is not present' do
      word = "TEST"
      letter = "o"
      expect(validator.is_letter_present_in_word?(word, letter)).to be false
    end

  end

  describe '#validate_body_part_removal' do

    it 'will return body_array if boolean is true' do
      boolean = true
      expect(validator.validate_body_part_removal(boolean)).to eq game_view.body_array
    end

    it 'will return body_array with one index removed if boolean is false' do
      boolean = true
      game_view.initialize_hangman_body
      expect(validator.validate_body_part_removal(boolean)).to eq game_view.remove_hangman_body_part
    end

  end

  describe '#correct_word?' do

    it 'will return false if user guess is not correct word' do
      expect(validator.correct_word?("TEST", "NO")).to be false
    end

    it 'will return true if user guess is correct word' do
      expect(validator.correct_word?("TEST", "TEST")).to be true      
    end

  end

  describe '#all_downcase?' do

    it 'will return false if parameter is not in downcase' do
      expect(validator.all_downcase?("TEST")).to be false
    end

    it 'will return true if parameter is in downcase' do
      expect(validator.all_downcase?("test")).to be true      
    end

  end

  describe '#end_of_game?' do

    it 'will return false if it is not the correct word' do
      expect(validator.end_of_game?("TEST", "no", 0)).to be false
    end

    it 'will return false if all the letters have not been guessed' do
      expect(validator.end_of_game?("TEST", "no", 0)).to be false
    end

    it 'will return false if player two has not had six tries' do
      expect(validator.end_of_game?("TEST", "no", 0)).to be false
    end

    it 'will return true if it is the correct word' do
      expect(validator.end_of_game?("TEST", "test", 0)).to be true
    end

    it 'will return true if all the letters have been guessed' do
      expect(validator.end_of_game?("test", "no", 0)).to be true
    end

    it 'will return true if player two has not had six tries' do
      expect(validator.end_of_game?("TEST", "no", 6)).to be true
    end

  end

  describe '#validate_win_or_loss' do

    it 'will return lose prompt if counter == 6' do
      expect(validator.validate_win_or_loss(6)).to eq "You lose!"
    end

    it 'will return win prompt if counter equals a number other than 6' do
      expect(validator.validate_win_or_loss(5)).to eq "You win!"
    end

  end

end