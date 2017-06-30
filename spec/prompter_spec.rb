require_relative '../prompter'

describe 'Prompter' do
  
  prompter = Prompter.new()
  
  describe '#get_prompt' do

    it 'will return a prompt based on string name of method' do
      prompt = "prompt_game_greeting"
      expect(prompter.get_prompt(prompt)).to eq "Welcome to Hangman!"
    end

    it 'will return a prompt based on string name of method' do
      prompt = "prompt_word"
      expect(prompter.get_prompt(prompt)).to eq "Player 1, please choose a word for Hangman."
    end

  end

  describe '.prompt_game_greeting' do

    it 'will return a string' do
      expect(prompter.prompt_game_greeting).to eq "Welcome to Hangman!"
    end

  end

  describe '.prompt_word' do

    it 'will return a string' do
      expect(prompter.prompt_word).to eq "Player 1, please choose a word for Hangman."
    end

  end

  describe '.prompt_guess' do

    it 'will return a string' do
      expect(prompter.prompt_guess).to eq "If you would like to guess the word, type in your word guess or type in a letter guess."
    end

  end

  describe '.prompt_not_a_word' do

    it 'will return a string' do
      expect(prompter.prompt_not_a_word).to eq "Your selection is not a word. Please enter a word."
    end

  end

  describe '.prompt_not_a_word_or_letter' do

    it 'will return a string' do
      expect(prompter.prompt_not_a_word_or_letter).to eq "That is not a word or a letter. Please enter a word or letter guess."
    end

  end

  describe '.prompt_incorrect_guess' do

    it 'will return a string' do
      expect(prompter.prompt_incorrect_guess).to eq "That guess is not the word nor in the word or you may have already used that guess."
    end

  end

  describe '.prompt_correct_guess' do

    it 'will return a string' do
      expect(prompter.prompt_correct_guess).to eq "That guess is correct!"
    end

  end

  describe '.prompt_you_win' do

    it 'will return a string' do
      expect(prompter.prompt_you_win).to eq "You win! You knew the correct word was: "
    end

  end

  describe '.prompt_you_lose' do

    it 'will return a string' do
      expect(prompter.prompt_you_lose).to eq "You lose! The correct word was: "
    end

  end
  
end