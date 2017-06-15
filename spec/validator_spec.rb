require_relative '../validator'
require_relative '../prompter'
require_relative 'mocks/mock_io_handler'

describe 'Validator' do

  prompter = Prompter.new
  mock_io_handler = MockIOHandler.new
  validator = Validator.new(prompter, mock_io_handler)
  
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

end