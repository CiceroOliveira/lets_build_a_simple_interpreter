require 'test/unit'
require_relative '../lib/interpreter.rb'
require_relative '../lib/bin_op.rb'

class TestInterpreter < Test::Unit::TestCase

  def test_calculator_multiplies
    token = Token.new(:MUL, '*')
    node = BinOp.new(
      Num.new(Token.new(:INTEGER, 2)),
      token,
      Num.new(Token.new(:INTEGER, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 6, interpreter.visit(node)
  end

  def test_calculator_divides
    token = Token.new(:DIV, '/')
    node = BinOp.new(
      Num.new(Token.new(:INTEGER, 8)),
      token,
      Num.new(Token.new(:INTEGER, 2))
    )
    interpreter = Interpreter.new(nil);
    assert_equal 4, interpreter.visit(node)
  end

  def test_calculator_divides_returns_integer
    token = Token.new(:DIV, '/')
    node = BinOp.new(
      Num.new(Token.new(:INTEGER, 9)),
      token,
      Num.new(Token.new(:INTEGER, 2))
    )
    interpreter = Interpreter.new(nil);
    assert_equal 4, interpreter.visit(node)
  end

  def test_calculator_adds
    token = Token.new(:PLUS, '+')
    node = BinOp.new(
      Num.new(Token.new(:INTEGER, 2)),
      token,
      Num.new(Token.new(:INTEGER, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 5, interpreter.visit(node)
  end

  def test_calculator_subtracts_handles_negative_results
    token = Token.new(:MINUS, '-')
    node = BinOp.new(
      Num.new(Token.new(:INTEGER, 2)),
      token,
      Num.new(Token.new(:INTEGER, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal -1, interpreter.visit(node)
  end

  def test_calculator_subtracts
    token = Token.new(:MINUS, '-')
    node = BinOp.new(
      Num.new(Token.new(:INTEGER, 5)),
      token,
      Num.new(Token.new(:INTEGER, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 2, interpreter.visit(node)
  end

  def test_calculator_many_terms
    token = Token.new(:MINUS, '-')
    left_node = BinOp.new(
      Num.new(Token.new(:INTEGER, 13)),
      token,
      Num.new(Token.new(:INTEGER, 3))
    )

    node = BinOp.new(
      left_node,
      token,
      Num.new(Token.new(:INTEGER, 2))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 8, interpreter.visit(node)
  end
end
