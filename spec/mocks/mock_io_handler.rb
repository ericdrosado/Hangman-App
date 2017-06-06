class MockIOHandler
  
  attr_reader :output_called_with
  attr_writer :stubbed_value

  def printer printable_item
    @output_called_with = printable_item
  end

  def get_input
    @stubbed_value
  end

  def word_blank word
    word = word.gsub(/[a-zA-Z]/, "_ ")
  end

end