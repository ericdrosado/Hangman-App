require_relative '../Validator'

describe 'Validator' do

  validator = Validator.new
  
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

  describe '#correct_word?' do

    it 'will return false if user guess is not correct word' do
      expect(validator.correct_word?("TEST", "NO")).to be false
    end

    it 'will return true if user guess is correct word' do
      expect(validator.correct_word?("TEST", "TEST")).to be true      
    end

  end

  describe '#has_blanks?' do

    it 'will return true if blanked word has blanks' do
      expect(validator.has_blanks?("T_ ST")).to be true
    end

    it 'will return false if blanked word has no blanks' do
      expect(validator.has_blanks?("TEST")).to be false
    end

  end

end