class Rpn 
  
  def initialize
     @inputs = []
   end
  
  def enter(input)
    
    if is_number?(input)
      @inputs << BigDecimal.new(input)
      input
    elsif is_operator?(input)
      if @inputs.count >= 2
        numbers = @inputs.pop(2)
        answer = evaluate(input, numbers)
        @inputs << answer
        answer
      else
        raise "Insufficient inputs"
      end
    else
      raise "Invalid Input"
    end 
    
  end
  
  def is_number?(input)
    input =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
  end
  
  def is_operator?(input)
    ["+", "-", "*", "/"].include?(input)
  end
  
  def evaluate(operator, numbers)
    numbers[0].send(operator, numbers[1])
  end
  
end
