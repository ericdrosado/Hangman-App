class Validator

  def initialize prompter, io_handler
    @prompter = prompter
    @io_handler = io_handler
  end

  def is_a_word? word 
    !! word.match(/^[a-zA-Z]+$/) && word.length > 1
  end

  def is_a_letter? letter 
    !! letter.match(/^[a-zA-Z]+$/) && letter.length < 2
  end

  def validate_selection prompt, validation_type
    while ! public_send(validation_type, type = @io_handler.get_input)
      @io_handler.print(prompt)
    end
    type
  end

end