require_relative '../validator'

describe 'Validator' do

  validator = Validator.new

  describe '#validate_guess' do

    it 'will return true if it is a word' do
      guess = "test"
      expect(validator.validate_guess(guess)).to be true
    end

    it 'will return true if it is a letter' do
      guess = "t"
      expect(validator.validate_guess(guess)).to be true
    end

    it 'will return false if it is not a word or a letter' do
      guess = "!"
      expect(validator.validate_guess(guess)).to be false
    end

  end

  describe '#is_guess_correct?' do

    it 'will return true if the letter guess is present in the word' do
      word = "TEST"
      guess = "t"
      expect(validator.is_guess_correct?(word,guess)).to be true
    end

    it 'will return false if the letter guess is not present in the word' do
      word = "TEST"
      guess = "a"
      expect(validator.is_guess_correct?(word,guess)).to be false
    end

    it 'will return true if the word guess is equal to word' do
      word = "TEST"
      guess = "test"
      expect(validator.is_guess_correct?(word,guess)).to be true
    end

    it 'will return false if the word guess is not equal to word' do
      word = "TEST"
      guess = "team"
      expect(validator.is_guess_correct?(word,guess)).to be false
    end

  end

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

  describe '.is_a_letter?' do

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

  describe '.is_letter_present_in_word?' do

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

  describe '.correct_word?' do

    it 'will return false if user guess is not correct word' do
      expect(validator.correct_word?("TEST", "NO")).to be false
    end

    it 'will return true if user guess is correct word' do
      expect(validator.correct_word?("TEST", "TEST")).to be true      
    end

  end

  describe '#end_of_game?' do

    let(:word) {word = "TEST"}
    let(:guess) {guess = "guess"}

    it 'will return false if it is not the correct word' do
      expect(validator.end_of_game?(word, guess)).to be false
    end

    it 'will return false if all the letters have not been guessed' do
      expect(validator.end_of_game?(word, guess)).to be false
    end

    it 'will return true if it is the correct word' do
      expect(validator.end_of_game?(word, "test")).to be true
    end

    it 'will return true if all the letters have been guessed' do
      expect(validator.end_of_game?("test", guess)).to be true
    end

  end

  describe '.word_match?' do

    it 'will return false if user guess is not correct word' do
      expect(validator.word_match?("TEST", "NO")).to be false
    end

    it 'will return true if user guess is correct word' do
      expect(validator.word_match?("TEST", "TEST")).to be true      
    end

  end

  describe '.all_downcase?' do

    it 'will return false if parameter is not in downcase' do
      expect(validator.all_downcase?("TEST")).to be false
    end

    it 'will return true if parameter is in downcase' do
      expect(validator.all_downcase?("test")).to be true      
    end

  end

  describe '#validate_win_or_loss' do

    it 'will return lose prompt if counter == 6' do
      allow(validator).to receive(:validate_win_or_loss).and_return("prompt_you_lose")
      expect(validator.validate_win_or_loss).to eq "prompt_you_lose"
    end

    it 'will return win prompt if counter equals a number other than 6' do
      allow(validator).to receive(:validate_win_or_loss).and_return("prompt_you_win")
      expect(validator.validate_win_or_loss).to eq "prompt_you_win"
    end

  end

end