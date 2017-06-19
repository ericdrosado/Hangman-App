require_relative '../game_view'

describe 'GameView' do

  game_view = GameView.new
  
  describe '#blank_word' do

    it 'will blank uppercase letters T and S' do
      expect(game_view.blank_word("TeSt")).to eq "_ e_ t"
    end

    it 'will blank uppercase letters T and E' do
      expect(game_view.blank_word("TEst")).to eq "_ _ st"
    end

  end

  describe '#swap_letters_by_case' do

    it 'will swap capital letter T for lowercase t' do
      expect(game_view.swap_letters_by_case("TEST", "t")).to eq "tESt"
    end

    it 'will swap capital letter E for lowercase e' do
      expect(game_view.swap_letters_by_case("TEST", "e")).to eq "TeST"
    end

  end

  describe '#guessed_letters_view' do

    it 'will concat "t" to guessed_letters' do
      expect(game_view.guessed_letters_view("t")).to eq "Your guessed letters are:  t "
    end

    it 'will concat "e" to guessed_letters' do
      expect(game_view.guessed_letters_view("e")).to eq "Your guessed letters are:  t e "
    end

  end

  describe '#display_hangman_head' do

    it 'will return a string' do
      expect(game_view.display_hangman_head).to eq "      " + "_____\n" + "     " + "( * * )\n" +  "      " + "(___)"
    end

  end

  describe '#display_hangman_upper_torso' do

    it 'will return a string' do
      expect(game_view.display_hangman_upper_torso).to eq "        " + "|\n" + "        " + "|\n"
    end

  end

  describe '#display_hangman_arms' do

    it 'will return a string' do
      expect(game_view.display_hangman_arms).to eq "    " + "\\___" + "|" + "___/"
    end

  end

  describe '#display_hangman_lower_torso' do

    it 'will return a string' do
      expect(game_view.display_hangman_lower_torso).to eq "        " + "|\n" + "        " + "|\n"
    end

  end

  describe '#display_hangman_legs' do

    it 'will return a string' do
      expect(game_view.display_hangman_legs).to eq "       " + "/ \\\n" + "      " + "/   \\\n" + "     " + "/     \\"
    end

  end

  describe '#display_hangman_feet' do

    it 'will return a string' do
      expect(game_view.display_hangman_feet).to eq "   " + "__|" + "     |__"
    end

  end

end