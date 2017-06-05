class MockIO
  attr_reader :output_called_with

  def printer printable_item
    @output_called_with = printable_item
  end

end