require 'test/unit'
require_relative '../lib/calc1.rb'
require_relative '../lib/interpreter.rb'

class TestCalculator < Test::Unit::TestCase

  def test_to_s_method
    token = Token.new(:integer, 3)
    assert_equal 'Token(integer, 3)', token.to_s
  end

  def test_interpreter_eof_found
    interpreter = Interpreter.new('');
    assert_equal 'Token(eof, )', interpreter.get_next_token.to_s
  end

  def test_interpreter_recognizes_digit
    interpreter = Interpreter.new('1');
    assert_equal 'Token(integer, 1)', interpreter.get_next_token.to_s
  end

  def test_interpreter_recognizes_two_digit
    interpreter = Interpreter.new('12');
    assert_equal 'Token(integer, 12)', interpreter.get_next_token.to_s
  end

  def test_interpreter_recognizes_plus_sign
    interpreter = Interpreter.new('+');
    assert_equal 'Token(plus, +)', interpreter.get_next_token.to_s
  end

  def test_interpreter_calculator
    interpreter = Interpreter.new('2+3');
    assert_equal 5, interpreter.expr()
  end

end
