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

    it 'will prompt if not a word and take in a new word' do
      expect(mock_io_handler).to receive(:get_input).and_return('t')
      expect(mock_io_handler).to receive(:print).with('Player 1, please choose a word for Hangman.')
      expect(mock_io_handler).to receive(:get_input).and_return('test')
      expect(validator.validate_selection(prompter.prompt_for_word, 'is_a_word?')).to eq "test"
    end

  end

  describe '#validate_guess' do

    it 'will return guess if it is a word' do
      expect(mock_io_handler).to receive(:get_input).and_return('test')
      expect(validator.validate_guess).to eq 'test'
    end

    it 'will return guess if it is a letter' do
      expect(mock_io_handler).to receive(:get_input).and_return('t')
      expect(validator.validate_guess).to eq 't'
    end

    it 'will prompt if guess is not a word or a letter' do
      expect(mock_io_handler).to receive(:get_input).and_return('!')
      expect(mock_io_handler).to receive(:print).with(prompter.prompt_not_a_word_or_letter)
      expect(mock_io_handler).to receive(:get_input).and_return('test')
      expect(validator.validate_guess).to eq 'test'
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

  describe '#is_guess_correct' do

    it 'will return prompt_correct_guess if true' do
      boolean = true
      expect(validator.is_guess_correct(boolean)).to eq prompter.prompt_correct_guess
    end

    it 'will return prompt_incorrect_guess if false' do
      boolean = false
      expect(validator.is_guess_correct(boolean)).to eq prompter.prompt_incorrect_guess
    end

  end

  describe '#validate_body_part_removal' do

    it 'will return body_array if boolean is true' do
      boolean = true
      expect(validator.validate_body_part_removal(boolean)).to eq game_view.body_array
    end

    it 'will return body_array with one index removed if boolean is false' do
      boolean = true
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

  describe '#is_guess_correct?' do

    it 'will return true if guess is a letter in the word' do
      guess = "t"
      word = "TEST"
      expect(validator.is_guess_correct?(word, guess)).to be true
    end

    it 'will return true if guess is correct' do
      guess = "test"
      word = "TEST"
      expect(validator.is_guess_correct?(word, guess)).to be true
    end

    it 'will return false if guess is incorrect' do
      guess = "team"
      word = "TEST"
      expect(validator.is_guess_correct?(word, guess)).to be false
    end

  end

  describe '#validate_guess_for_body_part_removal' do

    it 'will return body_array if letter guess is correct' do
      guess = "t"
      word = "TEST"
      expect(validator.validate_guess_for_body_part_removal(word, guess)).to eq game_view.body_array
    end

    it 'will return remove_hangman_body_part if guess is incorrect' do
      guess = "Team"
      word = "TEST"
      expect(validator.validate_guess_for_body_part_removal(word, guess)).to eq game_view.remove_hangman_body_part
    end

    it 'will return body_array if word_guess is correct' do
      guess = "test"
      word = "TEST"
      expect(validator.validate_guess_for_body_part_removal(word, guess)).to eq game_view.body_array
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

  describe '#validate_guess_counter_count' do

    it 'will increment guess_counter if false' do
      boolean = false
      guess_counter = 0
      expect(validator.validate_guess_counter_count(boolean, guess_counter)).to eq 1
    end

    it 'will not increment guess_counter if true' do
      boolean = true
      guess_counter = 0
      expect(validator.validate_guess_counter_count(boolean, guess_counter)).to eq 0
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

    it 'will return true if player two has had six tries' do
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