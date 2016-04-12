require_relative 'interpreter.rb'
require_relative 'lexer.rb'
require_relative 'parser.rb'

class Calculator

  def initialize(equation)
    lexer = Lexer.new(equation)
    parser = Parser.new(lexer)
    @interpreter = Interpreter.new(parser)
  end

  def calculate
    @interpreter.interpret()
  end

end
