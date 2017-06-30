require_relative '../game_view'
require_relative '../prompter'
require_relative 'mocks/mock_io_handler'

describe 'GameView' do

  mock_io_handler = MockIOHandler.new
  prompter = Prompter.new
  game_view = GameView.new(mock_io_handler, prompter)
  
  describe '#get_prompt' do

    it 'will print a prompt' do
      prompt = "prompt_game_greeting"
      expect(mock_io_handler).to receive(:print).and_return(prompt)
      expect(game_view.get_prompt(prompt)).to eq prompt
    end

    it 'will print a prompt' do
      prompt = "prompt_word"
      expect(mock_io_handler).to receive(:print).and_return(prompt)
      expect(game_view.get_prompt(prompt)).to eq prompt
    end

  end

  describe '#print_word' do

    it 'will print a word choice' do
      word = "test"
      expect(mock_io_handler).to receive(:print).and_return(word)
      expect(game_view.print_word(word)).to eq word
    end

    it 'will print a word choice' do
      word = "testing"
      expect(mock_io_handler).to receive(:print).and_return(word)
      expect(game_view.print_word(word)).to eq word
    end

  end

  describe '#get_input' do

    it 'will equal input' do
      expect(mock_io_handler).to receive(:get_input).and_return("test")
      expect(game_view.get_input).to eq "test"
    end

    it 'will equal input' do
      expect(mock_io_handler).to receive(:get_input).and_return("testing")
      expect(game_view.get_input).to eq "testing"
    end

  end

  describe '#blank_word' do

    it 'will blank uppercase letters T and S' do
      expect(game_view.blank_word("TeSt")).to eq "_ e_ t"
    end

    it 'will blank uppercase letters T and E' do
      expect(game_view.blank_word("TEst")).to eq "_ _ st"
    end

  end

  describe '.swap_letters_by_case' do

    it 'will swap capital letter T for lowercase t' do
      expect(game_view.swap_letters_by_case("TEST", "t")).to eq "tESt"
    end

    it 'will swap capital letter E for lowercase e' do
      expect(game_view.swap_letters_by_case("TEST", "e")).to eq "TeST"
    end

  end

  describe '.get_guesses' do

    it 'will concat "t" to get_guesses' do
      expect(game_view.get_guesses("t")).to eq "Your guesses are:  t "
    end

    it 'will concat "the" to get_guesses' do
      expect(game_view.get_guesses("the")).to eq "Your guesses are:  t the "
    end

  end

  describe '.display_hangman_head' do

    it 'will return a string' do
      expect(game_view.display_hangman_head).to eq "      _____\n     ( * * )\n      (___)"
    end

  end

  describe '.display_hangman_upper_torso' do

    it 'will return a string' do
      expect(game_view.display_hangman_upper_torso).to eq "        |\n        |\n"
    end

  end

  describe '.display_hangman_arms' do

    it 'will return a string' do
      expect(game_view.display_hangman_arms).to eq "    \\___|___/"
    end

  end

  describe '.display_hangman_lower_torso' do

    it 'will return a string' do
      expect(game_view.display_hangman_lower_torso).to eq "        |\n        |\n"
    end

  end

  describe '.display_hangman_legs' do

    it 'will return a string' do
      expect(game_view.display_hangman_legs).to eq "       / \\\n      /   \\\n     /     \\"
    end

  end

  describe '.display_hangman_feet' do

    it 'will return a string' do
      expect(game_view.display_hangman_feet).to eq "   __|     |__"
    end

  end

  describe '#get_hangman_body' do

    it 'will return body_array' do
      expect(game_view.get_hangman_body).to match_array [game_view.display_hangman_head, game_view.display_hangman_upper_torso, 
                                                            game_view.display_hangman_arms, game_view.display_hangman_lower_torso, 
                                                            game_view.display_hangman_legs, game_view.display_hangman_feet]
    end

  end

  describe '#get_current_hangman_view_correct' do

    it 'will return swapped letters with the current hangman game view' do
      word = "TEST"
      guess = "t"
      expect(game_view.get_current_hangman_view_correct(word, guess)).to eq "tESt"
    end

  end

  describe '#get_current_hangman_view_incorrect' do
    it 'will return guesses with the current hangman game view' do
      guess = "t"
      expect(game_view.get_current_hangman_view_incorrect(guess)).to eq "Your guesses are:  t the t t "
    end
  end
   
end