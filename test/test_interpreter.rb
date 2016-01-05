require 'test/unit'
require_relative '../lib/interpreter.rb'

class TestInterpreter < Test::Unit::TestCase

  def test_calculator_multiplies
    lexer = Lexer.new('2*3')
    interpreter = Interpreter.new(lexer);
    assert_equal 6, interpreter.expr()
  end

  def test_calculator_divides
    lexer = Lexer.new('8/2')
    interpreter = Interpreter.new(lexer);
    assert_equal 4, interpreter.expr()
  end

  def test_calculator_divides_returns_integer
    lexer = Lexer.new('9/2')
    interpreter = Interpreter.new(lexer);
    assert_equal 4, interpreter.expr()
  end

  def test_calculator_adds
    lexer = Lexer.new('2+3')
    interpreter = Interpreter.new(lexer);
    assert_equal 5, interpreter.expr()
  end

  def test_calculator_subtracts_handles_negative_results
    lexer = Lexer.new('2-3')
    interpreter = Interpreter.new(lexer);
    assert_equal -1, interpreter.expr()
  end

  def test_calculator_subtracts
    lexer = Lexer.new('5-3')
    interpreter = Interpreter.new(lexer);
    assert_equal 2, interpreter.expr()
  end

  def test_calculator_many_terms
    lexer = Lexer.new('13-3-2');
    interpreter = Interpreter.new(lexer);
    assert_equal 8, interpreter.expr()
  end

  def test_calculator_many_terms_with_whitespace
    lexer = Lexer.new('5- 3 +2')
    interpreter = Interpreter.new(lexer);
    assert_equal 4, interpreter.expr()
  end

  def test_calculator_multiple_operations
    lexer = Lexer.new('2 + 7 * 4')
    interpreter = Interpreter.new(lexer);
    assert_equal 30, interpreter.expr()
  end

  def test_calculator_multiple_operations_with_parentheses
    lexer = Lexer.new('7 + 3 * (10 / (12 / (3 + 1) - 1))')
    interpreter = Interpreter.new(lexer);
    assert_equal 22, interpreter.expr()
  end

end
