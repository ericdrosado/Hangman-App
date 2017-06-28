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
      expect(game_view.guessed_letters_view("t")).to eq "Your guesses are:  t "
    end

    it 'will concat "e" to guessed_letters' do
      expect(game_view.guessed_letters_view("e")).to eq "Your guesses are:  t e "
    end

  end

  describe '#display_hangman_head' do

    it 'will return a string' do
      expect(game_view.display_hangman_head).to eq "      _____\n     ( * * )\n      (___)"
    end

  end

  describe '#display_hangman_upper_torso' do

    it 'will return a string' do
      expect(game_view.display_hangman_upper_torso).to eq "        |\n        |\n"
    end

  end

  describe '#display_hangman_arms' do

    it 'will return a string' do
      expect(game_view.display_hangman_arms).to eq "    \\___|___/"
    end

  end

  describe '#display_hangman_lower_torso' do

    it 'will return a string' do
      expect(game_view.display_hangman_lower_torso).to eq "        |\n        |\n"
    end

  end

  describe '#display_hangman_legs' do

    it 'will return a string' do
      expect(game_view.display_hangman_legs).to eq "       / \\\n      /   \\\n     /     \\"
    end

  end

  describe '#display_hangman_feet' do

    it 'will return a string' do
      expect(game_view.display_hangman_feet).to eq "   __|     |__"
    end

  end

  describe '#get_current_hangman' do

    it 'will return body_array' do
      expect(game_view.get_current_hangman).to match_array game_view.body_array
    end

    it 'will return current body_array without display_hangman_feet if remove_hangman_body_part is called' do
      game_view.remove_hangman_body_part
      expect(game_view.get_current_hangman).to match_array [game_view.display_hangman_head, game_view.display_hangman_upper_torso, 
                                                            game_view.display_hangman_arms, game_view.display_hangman_lower_torso, 
                                                            game_view.display_hangman_legs]
    end

  end
  
  describe '#remove_hangman_body_part' do

    it 'will remove last index of body_array' do
      expect(game_view.remove_hangman_body_part).to match_array [game_view.display_hangman_head, game_view.display_hangman_upper_torso, 
                                                                 game_view.display_hangman_arms, game_view.display_hangman_lower_torso]
    end
  end
  
end