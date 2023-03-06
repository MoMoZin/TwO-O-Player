class Question

  attr_reader :num1, :num2

  def initialize()
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def checkAnswer(input)
    input == ( num1 + num2)
  end

  def ask_question
    "What does #{num1} plus #{num2} equal?"
  end
end