# Hangman-App
This is my first app implementing TDD. The game is written in Ruby and was tested with RSpec.

In order to play the game, run the game_start.rb file in the terminal using: 
    
    ~$:ruby game_start.rb

In order to run all the tests, in the directory that holds the .rb files, type 

    ~$:rspec 

in the command line to run all the tests or to run tests for each individual .rb file add the postfix of spec.rb after the file name. For example, game.rb, would be 

    ~$:rspec game_spec.rb.

Rules:
To play the game you need two players. One player will choose a word and the second player will try to guess the word within 6 attempts. In order to simplify the process, the second player can guess a letter to see if the letter is present in the word. With these letter hints the player can then try to determine what the word might be. If the letter does not appear in the word, the second player can consider this as a missed opportunity to capitalize on the advantage of knowing a letter in the word and in turn will lose an attempt.
