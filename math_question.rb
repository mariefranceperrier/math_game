class MathQuestion
  attr_reader :question, :correct_answer

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @question = "What does #{@num1} plus #{@num2} equal?"
    @correct_answer = @num1 + @num2
  end

  def correct_answer?(player_answer)
    player_answer.to_i == @correct_answer
  end
end
