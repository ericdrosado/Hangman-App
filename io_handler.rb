class IOHandler

  def printer printable_item
    puts printable_item
  end

  def get_input
    gets.chomp
  end

  def word_blank word
    word = word.gsub(/[a-zA-Z]/, "_ ")
  end

end